import 'package:wiet_test_app/feature/service/i_repository.dart';
import 'package:wiet_test_app/feature/service/model/service_model.dart';
import 'package:dio/dio.dart';

/// This is a mixin class for [IRepository]
/// It is used to manage the service  
abstract mixin class ServiceManager<T extends ServiceModel> {
  Dio get dio;
  String get path;
  T Function(Map<String, dynamic> json) get fromJson;
  //temp
  const String baseUrl = devEnv.baseUrl;
}
