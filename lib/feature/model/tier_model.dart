// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wiet_test_app/feature/model/main_model.dart';

part 'tier_model.g.dart';

@JsonSerializable()
@immutable
final class TierModel extends MainModel {
  TierModel({
    this.tierName,
    this.minPoint,
    this.maxPoint,
    this.seqNo,
    this.fontColor,
    this.bgColor,
    this.widgets,
  });
  factory TierModel.fromJson(Map<String, dynamic> json) {
    return _$TierModelFromJson(json);
  }
  final String? tierName;
  final int? minPoint;
  final int? maxPoint;
  final int? seqNo;
  final String? fontColor;
  final String? bgColor;
  final dynamic widgets;

  @override
  List<Object?> get props => [tierName, minPoint, maxPoint, seqNo, fontColor, bgColor, widgets];

  @override
  Map<String, dynamic> toJson() {
    return _$TierModelToJson(this);
  }

  @override
  String get key => 'tier';
}
