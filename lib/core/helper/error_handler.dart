import 'package:dio/dio.dart';
import 'package:wiet_test_app/core/constants/enum/service_status.dart';
import 'package:wiet_test_app/core/constants/extension/service_status_extension.dart';
import 'package:wiet_test_app/core/helper/failure.dart';

/// This class is used to handle the error from the Dio
final class ErrorHandler implements Exception {
  ErrorHandler._();

  /// This method is used to handle the error
  ErrorHandler.handler(dynamic error) {
    if (error is DioException) {
      failure = _handleError(error);
    }
  }

  /// This method is used to get the failure
  late Failure failure;
  Failure _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ServiceStatus.CONNECT_TIMEOUT.getFailure();
      case DioExceptionType.sendTimeout:
        return ServiceStatus.CONNECT_TIMEOUT.getFailure();
      case DioExceptionType.receiveTimeout:
        return ServiceStatus.CONNECT_TIMEOUT.getFailure();
      case DioExceptionType.badResponse:
        if (error.response != null && error.response?.statusCode != null) {
          return Failure(error.response!.statusCode!, error.response!.data['error'].toString());
        }
      case DioExceptionType.cancel:
        return ServiceStatus.NOT_FOUND.getFailure();
      case DioExceptionType.unknown:
        return ServiceStatus.INTERNAL_SERVER_ERROR.getFailure();
      case DioExceptionType.badCertificate:
        return ServiceStatus.INTERNAL_SERVER_ERROR.getFailure();
      case DioExceptionType.connectionError:
        return ServiceStatus.INTERNAL_SERVER_ERROR.getFailure();
    }
    return ServiceStatus.INTERNAL_SERVER_ERROR.getFailure();
  }
}
