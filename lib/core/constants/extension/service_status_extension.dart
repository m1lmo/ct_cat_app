import 'dart:io';

import 'package:wiet_test_app/core/constants/enum/service_status.dart';
import 'package:wiet_test_app/core/helper/failure.dart';

/// Extension for [ServiceStatus]
extension ServiceStatusExtension on ServiceStatus {
  Failure getFailure() {
    switch (this) {
      case ServiceStatus.SUCCESS:
        return const Failure(HttpStatus.ok, 'SUCCESS');
      case ServiceStatus.NO_CONTENT:
        return const Failure(HttpStatus.noContent, 'NO CONTENT');
      case ServiceStatus.BAD_REQUEST:
        return const Failure(HttpStatus.badRequest, 'BAD REQUEST');
      case ServiceStatus.FORBIDDEN:
        return const Failure(HttpStatus.forbidden, 'FORBIDDEN');
      case ServiceStatus.UNAUTHORIZED:
        return const Failure(HttpStatus.unauthorized, 'UNAUTHORIZED');
      case ServiceStatus.NOT_FOUND:
        return const Failure(HttpStatus.notFound, 'NOT FOUND');
      case ServiceStatus.INTERNAL_SERVER_ERROR:
        return const Failure(HttpStatus.internalServerError, 'SERVER ERROR');
      case ServiceStatus.CONNECT_TIMEOUT:
        return const Failure(
          HttpStatus.gatewayTimeout,
          'Connection Timeout',
        );
      case ServiceStatus.NO_INTERNET_CONNECTION:
        return const Failure(
          HttpStatus.serviceUnavailable,
          'No Internet Connection',
        );
    }
  }
}
