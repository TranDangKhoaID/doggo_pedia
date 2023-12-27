import 'package:json_annotation/json_annotation.dart';

class BaseResponse {
  @JsonKey(name: "success")
  bool? success;
}
