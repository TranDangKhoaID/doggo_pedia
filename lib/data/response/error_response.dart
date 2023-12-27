import 'package:doggo_pedia/data/response/base_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'error_response.g.dart';

@JsonSerializable()
class ErrorResponse extends BaseResponse {
  ErrorResponse();

  ErrorResponseData? error;

  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorResponseToJson(this);
}

@JsonSerializable()
class ErrorResponseData {
  ErrorResponseData();

  int? code;

  String? message;

  factory ErrorResponseData.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorResponseDataToJson(this);
}
