import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'environment.dart';

class AppConfigService {
  AppConfig _appConfig =
  new AppConfig(appName: "api", baseApiUrl: "", oneSignalAppId: "");
  AppEnvironment? _appEnvironment;
  String? _packageName;

  AppEnvironment? get appEnvironment => _appEnvironment;

  String get envString {
    if (_packageName?.endsWith(".dev") == true) {
      return "DEVELOP";
    } else if (_packageName?.endsWith(".uat") == true) {
      return "UAT";
    } else {
      return "PROD";
    }
  }

  Color get color {
    if (_packageName?.endsWith(".dev") == true) {
      return Colors.red;
    } else if (_packageName?.endsWith(".uat") == true) {
      return Colors.orange;
    } else {
      return Colors.green;
    }
  }

  AppConfig get config {
    return _appConfig;
  }

  setConfig(String value, AppEnvironment appEnvironment, String packageName) {
    _packageName = packageName;
    _appConfig = AppConfig.fromJson(jsonDecode(value));
    _appEnvironment = appEnvironment;
  }
}

class AppConfig {
  String? appName;
  String? baseApiUrl;
  String? baseStrapiUrl;
  bool? forceUpdate;
  String? updateMessage;
  String? oneSignalAppId;
  String? googleApiKey;

  AppUrl? appUrl;
  Android? android;
  IOS? iOS;

  AppConfig(
      {this.appName,
        this.baseApiUrl,
        this.baseStrapiUrl,
        this.forceUpdate,
        this.updateMessage,
        this.oneSignalAppId,
        this.appUrl,
        this.googleApiKey,
        this.android,
        this.iOS});

  AppConfig.fromJson(Map<String, dynamic> json) {
    appName = json['AppName'];
    baseApiUrl = json['BaseApiUrl'];
    baseStrapiUrl = json['BaseStrapiUrl'];
    forceUpdate = json['force_Update'];
    updateMessage = json['update_Message'];
    googleApiKey= json['googleApiKey'];
    oneSignalAppId = json['oneSignalAppId'];
    appUrl =
    json['AppUrl'] != null ? new AppUrl.fromJson(json['AppUrl']) : null;
    android =
    json['Android'] != null ? new Android.fromJson(json['Android']) : null;
    iOS = json['IOS'] != null ? new IOS.fromJson(json['IOS']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AppName'] = this.appName;
    data['BaseApiUrl'] = this.baseApiUrl;
    data['BaseStrapiUrl'] = this.baseStrapiUrl;
    data['force_Update'] = this.forceUpdate;
    data['update_Message'] = this.updateMessage;
    data['oneSignalAppId'] = this.oneSignalAppId;
    data['googleApiKey'] = this.googleApiKey;
    if (this.appUrl != null) {
      data['AppUrl'] = this.appUrl!.toJson();
    }
    if (this.android != null) {
      data['Android'] = this.android!.toJson();
    }
    if (this.iOS != null) {
      data['IOS'] = this.iOS!.toJson();
    }
    return data;
  }
}
class AppUrl {
  String? terms;
  String? privacy;
  String? refundPolicy;
  String? contactEmail;
  String? contactPhone;

  AppUrl(
      {this.terms,
        this.privacy,
        this.refundPolicy,
        this.contactEmail,
        this.contactPhone});

  AppUrl.fromJson(Map<String, dynamic> json) {
    terms = json['terms'];
    privacy = json['privacy'];
    refundPolicy = json['refund_policy'];
    contactEmail = json['contact_email'];
    contactPhone = json['contact_phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['terms'] = this.terms;
    data['privacy'] = this.privacy;
    data['refund_policy'] = this.refundPolicy;
    data['contact_email'] = this.contactEmail;
    data['contact_phone'] = this.contactPhone;
    return data;
  }
}

class Android {
  String? url;
  String? version;
  String? appID;

  Android({this.url, this.version, this.appID});

  Android.fromJson(Map<String, dynamic> json) {
    url = json['Url'];
    version = json['Version'];
    appID = json['AppID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Url'] = this.url;
    data['Version'] = this.version;
    data['AppID'] = this.appID;
    return data;
  }
}

class IOS {
  String? url;
  String? version;
  String? appId;

  IOS({this.url, this.version, this.appId});

  IOS.fromJson(Map<String, dynamic> json) {
    url = json['Url'];
    version = json['Version'];
    appId = json['AppId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Url'] = this.url;
    data['Version'] = this.version;
    data['AppId'] = this.appId;
    return data;
  }
}
