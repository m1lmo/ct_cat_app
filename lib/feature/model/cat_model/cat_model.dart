// ignore_for_file: public_member_api_docs

import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wiet_test_app/feature/model/main_model/main_model.dart';
part 'cat_model.g.dart';

@JsonSerializable()
@immutable
final class CatModel extends MainModel {
  CatModel({
    this.id,
    this.url,
    this.width,
    this.height,
  });

  factory CatModel.fromJson(Map<String, dynamic> json) {
    return _$CatModelFromJson(json);
  }
  final String? id;
  final String? url;
  final int? width;
  final int? height;

  @override
  List<Object?> get props => [id, url, width, height];

  @override
  Map<String, dynamic> toJson() {
    return _$CatModelToJson(this);
  }

  @override
  String get key => 'cat';
}
