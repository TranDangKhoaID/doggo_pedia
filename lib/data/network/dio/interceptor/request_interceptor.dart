import 'package:dio/dio.dart';
import 'package:doggo_pedia/app/constants/request_constant.dart';
import 'package:doggo_pedia/app/helpers/device_helper.dart';
import 'package:flutter/foundation.dart';

class RequestInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    const String accessToken = "";

    //final String languageCode = AppPreferences.instance.getAppLanguage();

    if (accessToken.isNotEmpty) {
      await options.headers
          .putIfAbsent("Authorization", () => "Bearer $accessToken");
    }

    if (kIsWeb) {
      // Thêm Access-Control-Allow-Origin Header với giá trị '*'.
      options.headers['Access-Control-Allow-Origin'] = '*';
    }
    // Lấy thông tin về thiết bị sử dụng DeviceHelper.
    final DeviceInfoData deviceInfoData = await DeviceHelper.getDeviceInfo();
    // Thêm các thông tin thiết bị vào Header của yêu cầu.
    options.headers.addAll({
      "DeviceOS": deviceInfoData.deviceOS,
      "Model": deviceInfoData.model,
      "DeviceId": deviceInfoData.deviceId,
      "OSVersion": deviceInfoData.versionOS,
      "AppVersion": deviceInfoData.appVersion,
      "DeviceCode": RequestConstant.deviceCode,
      "Platform": deviceInfoData.deviceOS
    });

    // Thêm thông tin về mã ngôn ngữ vào URL yêu cầu.
    //options.path += "?culture=$languageCode";

    return handler.next(options);
  }

  // @override
  // void onError(DioException err, ErrorInterceptorHandler handler) {
  //   super.onError(err, handler);
  // }

  // @override
  // void onResponse(Response response, ResponseInterceptorHandler handler) {
  //   super.onResponse(response, handler);
  // }
}
