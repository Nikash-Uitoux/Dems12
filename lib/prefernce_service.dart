import 'dart:convert';

import 'package:dems1/shared_preferences.dart';
import 'package:flutter/cupertino.dart';

class PreferenceService {
  static const String bearerToken = "BEARERTOKEN";
  static String is_Local_Trip_Available = "is_local_trip_available";
  static String? update_frequency = "update_frequency";


  SharedPreferences? pref;
  String? user_id = "user_id";
  String? user_email = "user_email";
  String? user_fname = "user_fname";
  String? user_lname = "user_lname";
  String? user_name = "user_name";
  String? user_dob = "user_dob";
  String? user_mobile = "user_mobile";
  String? user_image = "user_image";
  String? selected_trip = "selected_trip";
  String? is_Employee = "is_employee";
  String? is_Manager =" is_manager";
  String? is_Senior_Manager = "is_senior_manager";
  String? designation = "designation";
  String? manager_name = "manager_name";
  String? employee_code = "employee_code";


  init() async {
    pref = await SharedPreferences.getInstance();
  }

  setString(String? key, String? value) {
    pref?.setString(key!, value!);
    print("Data Saved $key ------ $value");
  }

  String getString(String? key) {
    return pref?.getString(key!) ?? "";
  }

  setBool(String key, bool value) {
    pref?.setBool(key, value);
    print("Data Saved $key ------ $value");
  }

  bool getBool(
      String key,
      ) {
    return pref?.getBool(key) ?? false;
  }

  setInt(String key, int value) {
    pref?.setInt(key, value);
    print("Data Saved $key ------ $value");
  }

  int getInt(String key) {
    return pref?.getInt(key) ?? 0;
  }

  clearData() async {
    pref?.clear();
  }

  setBearerToken(String value) {
    pref?.setString(bearerToken, value);
    debugPrint("Bearer Token stored successfully");
  }
}
