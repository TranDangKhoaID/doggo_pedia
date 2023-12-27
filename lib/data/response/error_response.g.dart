// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorResponse _$ErrorResponseFromJson(Map<String, dynamic> json) =>
    ErrorResponse()
      ..success = json['success'] as bool?
      ..error = json['error'] == null
          ? null
          : ErrorResponseData.fromJson(json['error'] as Map<String, dynamic>);

Map<String, dynamic> _$ErrorResponseToJson(ErrorResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error': instance.error,
    };

ErrorResponseData _$ErrorResponseDataFromJson(Map<String, dynamic> json) =>
    ErrorResponseData()
      ..code = json['code'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ErrorResponseDataToJson(ErrorResponseData instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };
