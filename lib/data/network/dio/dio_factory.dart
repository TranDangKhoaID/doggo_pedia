import 'package:dio/dio.dart';
import 'package:doggo_pedia/app/config/flavor.dart';
import 'package:doggo_pedia/app/constants/api_key_constant.dart';
import 'package:doggo_pedia/data/network/dio/interceptor/request_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class RequestHeaders {
  // Định nghĩa các hằng số cho các tên header được sử dụng trong yêu cầu HTTP
  static const String applicationJson = "application/json";
  static const String contentType = "content-type";
  static const String accept = "accept";
  static const String authorization = "Authorization";
  static const String defaultLanguage = "language";
  static const String securedKey = 'secured';
  static const String culture = 'vi_VN';
  static const String brandCode = 'BrandCode';
  //static const String posNO = 'PosNO';
  static const String apiKey = ApiKeyContant.apiKey;
}

@module
abstract class DioFactory {
  Dio get dio {
    final dio = Dio();

    Duration timeOut = const Duration(minutes: 1); // 1 phút

    Map<String, String> headers = {
      RequestHeaders.contentType: RequestHeaders.applicationJson,
      RequestHeaders.accept: RequestHeaders.applicationJson,
      'x-api-key': RequestHeaders.apiKey,
    };

    dio.options = BaseOptions(
      baseUrl: FlavorConfig.instance!.values.baseUrl,
      connectTimeout: timeOut,
      receiveTimeout: timeOut,
      headers: headers,
    );

    dio.interceptors.addAll([
      RequestInterceptor(),
      // CacheManager.dioCacheManager.interceptor,
    ]);

    if (kReleaseMode) {
      // print("release mode no logs");
    } else {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
        ),
      );
    }

    // Trả về instance của Dio đã được cấu hình.
    return dio;
  }
}
