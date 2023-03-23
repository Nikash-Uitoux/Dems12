import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dems1/prefernce_service.dart';
import 'package:dems1/service/api_model/request_model.dart';
import 'package:dems1/service/api_model/request_settings.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as HTTP;

import 'api_base_helper.dart';
import 'api_exception.dart';
import 'app_config.dart';
import 'constants.dart';
import 'core/model/oldmodel/base_model.dart';
import 'dialogue_service.dart';
import 'error_response_exception.dart';
import 'locator.dart';
import 'logger.dart';
import 'no_response_exception.dart';

class ApiBaseService extends ApiBaseHelper {
  final PreferenceService _preferenceService = locator<PreferenceService>();
  final DialogService _dialogService = locator<DialogService>();
  var client = HTTP.Client();

  Future<List<T>> requestList<T extends BaseModel>(
      RequestSettings settings) async {
    try {
      var response = await _sendAsync(
          settings.method, settings.endPoint, settings.params,
          authenticated: settings.authenticated);
      if (response != null) {
        var jsonResponse = jsonDecode(response.body);
        if (response.statusCode == 200 || response.statusCode == 201) {
          print("RESPONSE BODY");
          print(response.body);
          return jsonDecode(response.body)
              .map((e) => BaseModel.createFromMap(e))
              .cast<T>()
              .toList();
        }

        // else {
        //   throw ErrorResponseException.fromJson(jsonResponse);
        // }
      }
    } on TimeoutException catch (exception, stacktrace) {
      _dialogService.showDialog(
          title: "Server Error",
          description: "There is a problem connecting server");
    } on ErrorResponseException catch (exception) {
      throw exception;
    } catch (exception, stacktrace) {
      Logger.e(exception.toString(), e: exception, s: stacktrace);
    }
    throw NoResponseException(
      message: "No Response: something error",
    );
  }

  Future<T> request<T extends BaseModel>(RequestSettings settings) async {
    try {
      Object? body;
      if (settings.params != null) {
        body = settings.params!;
      }
      if (settings.isMultipartRequest) {
        HTTP.MultipartRequest multipartRequest =
        _initMultipartRequest(settings.method, settings.endPoint);

        for (MapEntry<String, dynamic> data in settings.params!.entries) {
          if (data.value is File) {
            multipartRequest.files.add(await HTTP.MultipartFile.fromPath(
              data.key,
              data.value.path,
            ));
          } else {
            multipartRequest.fields[data.key] = data.value.toString();
          }
        }
        body = multipartRequest;
      }

      var response = await _sendAsync(settings.method, settings.endPoint,
          body != null ? body : settings.params,
          authenticated: settings.authenticated);
      if (response != null) {
        var jsonResponse = jsonDecode(response.body);

        if (response.statusCode == 200 || response.statusCode == 201) {
          return BaseModel.createFromMap(jsonDecode(response.body));
        } else {
          throw ErrorResponseException.fromJson(jsonResponse);
        }
      }
    } on TimeoutException catch (exception) {
      _dialogService.showDialog(
          title: "Server Error",
          description: "There is a problem connecting server");
    } on ErrorResponseException catch (exception) {
      throw exception;
    } catch (exception, stacktrace) {
      Logger.e(exception.toString(), e: exception, s: stacktrace);
    }
    throw NoResponseException(
      message: "No Response: something error",
    );
  }

  Future<HTTP.Response?> _sendAsync(
      String method, String endPoint, Object? body,
      {Map<String, String>? queryParams, bool authenticated = true}) async {
    // Generate URL from Base Url & Endpoint
    // Concatenate query params if exists
    final AppConfigService _appConfigService = locator<AppConfigService>();
    print(_appConfigService.config.baseApiUrl);

    String baseUrl = _appConfigService.config.baseApiUrl!;
    // String baseUrl = "http://dev-app-dems.uitoux.in/dems/eyatra/api/";

    // if (endPoint.startsWith("/strapi/")) {
    //   baseUrl = _appConfigService.config.strapiBaseApiUrl;
    // }
    endPoint = endPoint.startsWith("http") ? endPoint : baseUrl + endPoint;
    var url = Uri.parse('$endPoint${queryParams != null ? {
      Uri(queryParameters: queryParams).query
    } : ""}');
    print(url);
    print(queryParams);
    print(body);
    // Create Http Request using Method & URL
    HTTP.Request requestMessage = HTTP.Request(method, url);

    // Add Body Content to Request, Serialize Body Object if it is not a String
    // Add Headers to Request from _headers() function
    if (body is! HTTP.MultipartRequest) {
      requestMessage.body = (body is String) ? body : serialize(body);
    }
    requestMessage.headers.addAll(_headers(body, authenticated));

    // Declared HTTP Response Object
    HTTP.Response? response;

    try {
      // If body Object is Multipart Request, add headers to body object
      if (body is HTTP.MultipartRequest)
        body.headers.addAll(requestMessage.headers);

      print(requestMessage.headers);

      // Stream Response using HTTP
      // Send body if it is a Multipart Request, else send Request Message
      HTTP.BaseRequest request;
      if (body is HTTP.MultipartRequest) {
        request = body;
      } else {
        request = requestMessage;
      }
      response = await HTTP.Response.fromStream(await client.send(request));
    } on HttpException catch (e) {
      print("ERROR EXCEPTION $e");
      var error = ApiException(handleConnectionError());
      if ((error != null && error.error != null)) {
        if (error.error.getSingleMessage() != null) {
          locator<DialogService>().showDialog(
              title: error.error.message ?? '',
              description: error.error.getSingleMessage());
        }
      }
    }

    // [Returns]
    // Process and Return Response data according to the Response Status Code
    return _handleResponse(response);
  }

  Future<HTTP.Response?> uploadImageToServer(File file) async {
    HTTP.MultipartRequest request =
    _initMultipartRequest(RequestMethod.POST, 'admin/corners/import');

    if (file != null) {
      request.files.add(await HTTP.MultipartFile.fromPath(
        '',
        file.path,
      ));
    }

    var response = await _sendAsync(
        RequestMethod.POST, 'admin/corners/import', request,
        authenticated: true);
    if (response != null) {
      print(json.decode(response.body));
      return response;
    }
    return null;
  }

  HTTP.MultipartRequest _initMultipartRequest(String method, String path) {
    // String baseUrl = _appConfigService.config.baseApiUrl!;

    String baseUrl = "http://dev-app-dems.uitoux.in/dems/eyatra/api/";
    var url = Uri.parse(baseUrl + path);

    return new HTTP.MultipartRequest(method, url);
  }

  // [Returns]
  // Add Headers according to [body] Object Type
  // Add Authentication Token if [authenticated] is true
  Map<String, String> _headers(Object? body, bool authenticated) {
    Map<String, String> headerParams = {};
    headerParams["HttpHeaders.contentTypeHeader"] = "application/json";

    if (body is String) {
      headerParams["Content-Type"] = "application/x-www-form-urlencoded";
    } else if (body is Map) {
      headerParams['Accept'] = "application/json";
      headerParams["Content-Type"] = "application/json";
    } else if (body is HTTP.MultipartRequest) {
      headerParams['Accept'] = "application/json";
      headerParams["Content-Type"] = "multipart/form-data";
    }

    if (authenticated != null && authenticated) {

      String? prefToken = getToken();
      print("*******Pref Token *******"+prefToken!+"****************");
      headerParams['Authorization'] = "Bearer ${prefToken}";
      // if (_preferenceService.getCartId() != 0) {
      //   headerParams["zpc"] = _preferenceService.getCartId().toString();
      //   print('zpc ${_preferenceService.getCartId().toString()}');
      // }
    }

    return headerParams;
  }

  String? getToken() {
    if(_preferenceService.getString(PreferenceService.bearerToken).isNotEmpty) {
      return _preferenceService.getString(PreferenceService.bearerToken);
    }else{
      return Constants.bearerToken;
    }
  }

  // [Returns]
  // Process and Return Response data according to the Response Status Code
  Future<HTTP.Response?> _handleResponse(HTTP.Response? response) async {
    if (response == null) {
      return null;
    }

    debugPrint(response.body);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      print("response printing from hagle responce $response");
      return response;
    } else if (response.statusCode == 401) {
      Fluttertoast.showToast(
          msg: "Your session has expired. Please login again");
      // _preferenceService.clearData();
      // navigationService.popAllAndPushNamed(Routes.login);
    } else if (response.statusCode >= 400 && response.statusCode < 500) {
      var error = await handleApiError(response, false);
      throw ErrorResponseException(error: error?.message);
    } else if (response.statusCode >= 500) {
      Fluttertoast.showToast(
          msg: "Your session has expired. Please login again");
      // _preferenceService.clearData();
      // navigationService.popAllAndPushNamed(Routes.login);
      print("response printing from hagle responce $response   500");
    }

    return null;
  }
}
