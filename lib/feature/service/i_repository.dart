import 'dart:io';

import 'package:dio/dio.dart';
import 'package:wiet_test_app/core/helper/error_handler.dart';
import 'package:wiet_test_app/core/widget/c_notify.dart';
import 'package:wiet_test_app/feature/service/manager/service_manager.dart';
import 'package:wiet_test_app/feature/service/model/service_model.dart';

/// Base class for repository's
/// extend the class with [ServiceModel] to use the repository
abstract class IRepository<T extends ServiceModel> extends ServiceManager<T> {
  Future<bool> postData(T data) async {
    try {
      print(data.toJson());
      final response = await dio.post<Map<String, dynamic>>(path, data: data.toJson());
      return response.statusCode == HttpStatus.created;
    } on DioException catch (e) {
      final failure = ErrorHandler.handler(e).failure;
      CNotify(
        title: 'Error',
        message: failure.message,
      ).show();
      return false;
    }
  }

  Future<T?> fetchData() async {
    try {
      final response = await dio.get<dynamic>(path);
      if (response.statusCode != HttpStatus.ok) return null;
      final datas = response.data;
      if (datas is Map<String, dynamic>) {
        if (datas.isEmpty) return null;
        final data = fromJson(datas);
        return data;
      }
      return null;
    } on DioException catch (e) {
      final failure = ErrorHandler.handler(e).failure;
      CNotify(
        title: 'Error',
        message: failure.message,
      ).show();
      return null;
    }
  }
}
