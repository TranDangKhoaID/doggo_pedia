import 'package:dio/dio.dart';
import 'package:doggo_pedia/data/network/dio/failure.dart';
import 'package:doggo_pedia/data/response/error_response.dart';
import 'package:doggo_pedia/presentation/manager/locale_keys.dart';

enum DataSource {
  success,
  noContent,
  badRequest,
  forbidden,
  unauthorized,
  notFound,
  internalServerError,
  connectTimeout,
  cancel,
  receiveTimeout,
  sendTimeout,
  cacheError,
  noInternetConnection,
  defaultError,
  firebaseAuthError,
  registerDuplicateEmailError
}

class ResponseCode {
  // API status codes
  static const int success = 200; // success with data
  static const int noContent = 201; // success with no content
  static const int badRequest = 400; // failure, api rejected the request
  static const int forbidden = 403; // failure, api rejected the request
  static const int unauthorized = 401; // failure user is not unauthorized
  static const int notFound =
      404; // failure, api url is not correct and not found
  static const int internalServerError =
      500; // failure, crash happened in server side

  // local status code
  static const int defaultError = -1;
  static const int connectTimeout = -2;
  static const int cancel = -3;
  static const int receiveTimeout = -4;
  static const int sendTimeout = -5;
  static const int cacheError = -6;
  static const int noInternetConnection = -7;

  //firebase status error
  static const int firebaseAuthError = -100;

  //firebase status error
  static const int sessionExist = -200;
}

class ResponseMessage {
  // API status codes
  // API response codes
  static String success = LocaleKeys.success.trim();
  static String noContent = LocaleKeys.no_content.trim();
  static String badRequest = LocaleKeys.bad_request_error..trim();
  static String forbidden = LocaleKeys.forbidden_error.trim();
  static String unauthorized = LocaleKeys.unauthorized_error.trim();
  static String notFound = LocaleKeys.not_found_error.trim();
  static String internalServerError = LocaleKeys.internal_server_error.trim();

  // local responses codes
  static String defaultError = LocaleKeys.default_error.trim();
  static String connectTimeout = LocaleKeys.timeout_error.trim();
  static String cancel = LocaleKeys.default_error.trim();
  static String receiveTimeout = LocaleKeys.timeout_error.trim();
  static String sendTimeout = LocaleKeys.timeout_error.trim();
  static String cacheError = LocaleKeys.default_error.trim();
  static String noInternetConnection = LocaleKeys.no_internet_error.trim();
}

class ApiInternalStatus {
  static const int success = 200;
  static const int failure = 400;
}

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      // dio error so its error from response of the API
      failure = _handleError(error);
    } else {
      // default error
      failure = DataSource.defaultError.getFailure();
    }
  }

  Failure _handleError(DioException error) {
    try {
      switch (error.type) {
        // case DioErrorType.connectTimeout:
        //   return DataSource.connectTimeout.getFailure();
        case DioExceptionType.sendTimeout:
          return DataSource.sendTimeout.getFailure();
        case DioExceptionType.receiveTimeout:
          return DataSource.receiveTimeout.getFailure();
        case DioExceptionType.cancel:
          return DataSource.cancel.getFailure();
        case DioExceptionType.badResponse:
          if (error.response?.data != null && error.response?.data is Map) {
            ErrorResponse errorResponse =
                ErrorResponse.fromJson(error.response!.data);
            if (errorResponse.error != null &&
                errorResponse.error?.code != null &&
                errorResponse.error?.message != null) {
              return Failure(
                errorResponse.error!.code ?? ResponseCode.defaultError,
                errorResponse.error!.message ?? ResponseMessage.defaultError,
              );
            }
          } else {
            switch (error.response?.statusCode) {
              case ResponseCode.badRequest:
                return DataSource.badRequest.getFailure();
              case ResponseCode.forbidden:
                return DataSource.forbidden.getFailure();
              case ResponseCode.unauthorized:
                return DataSource.unauthorized.getFailure();
              case ResponseCode.notFound:
                return DataSource.notFound.getFailure();
              case ResponseCode.internalServerError:
                return DataSource.internalServerError.getFailure();
              default:
                return DataSource.defaultError.getFailure();
            }
          }
          return DataSource.defaultError.getFailure();
        case DioExceptionType.connectionTimeout:
          return DataSource.connectTimeout.getFailure();
        case DioExceptionType.badCertificate:
          return DataSource.defaultError.getFailure();
        case DioExceptionType.connectionError:
          return DataSource.defaultError.getFailure();

        case DioExceptionType.unknown:
          if (error.error is Failure) {
            return error.error as Failure;
          }
          return DataSource.defaultError.getFailure();
      }
    } catch (e) {
      return DataSource.defaultError.getFailure();
    }
  }
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.badRequest:
        return Failure(ResponseCode.badRequest, ResponseMessage.badRequest);
      case DataSource.forbidden:
        return Failure(ResponseCode.forbidden, ResponseMessage.forbidden);
      case DataSource.unauthorized:
        return Failure(ResponseCode.unauthorized, ResponseMessage.unauthorized);
      case DataSource.notFound:
        return Failure(ResponseCode.notFound, ResponseMessage.notFound);
      case DataSource.internalServerError:
        return Failure(ResponseCode.internalServerError,
            ResponseMessage.internalServerError);
      case DataSource.connectTimeout:
        return Failure(
            ResponseCode.connectTimeout, ResponseMessage.connectTimeout);
      case DataSource.cancel:
        return Failure(ResponseCode.cancel, ResponseMessage.cancel);
      case DataSource.receiveTimeout:
        return Failure(
            ResponseCode.receiveTimeout, ResponseMessage.receiveTimeout);
      case DataSource.sendTimeout:
        return Failure(ResponseCode.sendTimeout, ResponseMessage.sendTimeout);
      case DataSource.cacheError:
        return Failure(ResponseCode.cacheError, ResponseMessage.cacheError);
      case DataSource.noInternetConnection:
        return Failure(ResponseCode.noInternetConnection,
            ResponseMessage.noInternetConnection);
      case DataSource.defaultError:
        return Failure(ResponseCode.defaultError, ResponseMessage.defaultError);
      default:
        return Failure(ResponseCode.defaultError, ResponseMessage.defaultError);
    }
  }
}
