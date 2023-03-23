import 'package:dems1/ui/dashboard/dashboard_viewmodel.dart';
import 'package:flutter/cupertino.dart';

import '../../../api_base_service.dart';
import '../../../app_config.dart';
import '../../../constants.dart';
import '../../../dialogue_service.dart';
import '../../../environment.dart';
import '../../../error_response_exception.dart';
import '../../../locator.dart';
import '../../../navigator_service.dart';
import '../../../no_response_exception.dart';
import '../../../prefernce_service.dart';
import '../../../service/api_model/request_settings.dart';
import 'base_model.dart';

class Base extends DashViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();
  final PreferenceService _preferenceService = locator<PreferenceService>();
  final Constants _constants = locator<Constants>();

  AppEnvironment? appEnvironment = locator<AppConfigService>().appEnvironment;

  // PreferenceService get preferenceService => _preferenceService;

  NavigationService get navigationService => _navigationService;

  DialogService get dialogService => _dialogService;

  PreferenceService get preferenceService => _preferenceService;

  Constants get constants => _constants;

  DashViewModel() {
    this.onInit();
  }

  @override
  Future onInit() async {
    return true;
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<T?> request<T extends BaseModel>(settings) async {
    try {
      return await ApiBaseService().request(settings);
    } on ErrorResponseException catch (exception) {
      handleErrorResponse(settings, exception);
    } on NoResponseException catch (exception) {
      handleNoResponse(settings, exception);
    }

    return null;
  }

  Future<List<T>?> requestList<T extends BaseModel>(
      RequestSettings settings) async {
    try {
      return await ApiBaseService().requestList(settings);
    } on ErrorResponseException catch (exception) {
      handleErrorResponse(settings, exception);
    } on NoResponseException catch (exception) {
      handleNoResponse(settings, exception);
    }

    return null;
  }

  void handleNoResponse(
      RequestSettings settings, NoResponseException exception) {
    debugPrint(exception.message);
  }

  void handleErrorResponse(
      RequestSettings settings, ErrorResponseException exception) {
    int length = exception.errors?.length ?? 0;
    String message = exception.error ?? '';
    dialogService.showDialog(title: "Error", description: message);
  }

  void handleException() => debugPrint("HANDLE EXCEPTION");
}
