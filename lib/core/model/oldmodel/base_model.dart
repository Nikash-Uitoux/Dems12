import 'base_object.dart';
import 'package:vgts_plugin/form/base_object.dart' show BaseObject;


class BaseModel extends BaseObject {
  bool? success;
  String? message;

  BaseModel();

  BaseModel.args(this.success, this.message);

  BaseModel formJson(Map<String, dynamic> json) {
    throw ("fromJson not implemented");
  }

  Map<String, dynamic> toRequestParam() {
    throw ("toRequestParam not implemented. Please check the modal object");
  }

  Object get key {
    throw ("Get key not defined");
  }

  String get text {
    return this.runtimeType.toString();
  }

  static createFromMap(e) {}

}