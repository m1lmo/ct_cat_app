import 'package:dio/src/dio.dart';
import 'package:wiet_test_app/feature/model/data_model/data_model.dart';
import 'package:wiet_test_app/feature/service/i_repository.dart';

/// DataRepository for DataModel
final class DataRepository extends IRepository<DataModel> {
  DataRepository(this.dio);
  @override
  final Dio dio;

  @override
  DataModel Function(Map<String, dynamic> json) get fromJson => DataModel.fromJson;

  @override
  String get path => '/api/test/data';
}
