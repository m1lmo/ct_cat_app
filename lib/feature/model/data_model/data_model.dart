// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wiet_test_app/feature/model/main_model/main_model.dart';
import 'package:wiet_test_app/feature/model/result_model/result_model.dart';
part 'data_model.g.dart';

@JsonSerializable()
@immutable
final class DataModel extends MainModel {
  DataModel({
    this.version,
    this.statusCode,
    this.isSuccess,
    this.result,
    this.message,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return _$DataModelFromJson(json);
  }
  @JsonKey(name: 'Version')
  final String? version;
  @JsonKey(name: 'IsSuccess')
  final bool? isSuccess;
  @JsonKey(name: 'Result')
  final ResultModel? result;
  @JsonKey(name: 'Message')
  final String? message;
  @JsonKey(name: 'StatusCode')
  final int? statusCode;

  @override
  List<Object?> get props => [version, isSuccess, result, message, statusCode];

  @override
  Map<String, dynamic> toJson() {
    return _$DataModelToJson(this);
  }

  @override
  String get key => 'data';
}
