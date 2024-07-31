// ignore_for_file: public_member_api_docs

import 'package:json_annotation/json_annotation.dart';
import 'package:wiet_test_app/feature/model/cat_model.dart';
import 'package:wiet_test_app/feature/model/main_model.dart';
import 'package:wiet_test_app/feature/model/tier_model.dart';
part 'result_model.g.dart';

@JsonSerializable()
final class ResultModel extends MainModel {
  ResultModel({
    this.cats,
    this.tiers,
    this.currentTier,
    this.tierPoints,
  });

  factory ResultModel.fromJson(Map<String, dynamic> json) {
    return _$ResultModelFromJson(json);
  }

  final List<CatModel>? cats;
  final List<TierModel>? tiers;
  final String? currentTier;
  final int? tierPoints;

  @override
  List<Object?> get props => [cats, tiers, currentTier, tierPoints];

  Map<String, dynamic> toJson() {
    return _$ResultModelToJson(this);
  }
  
  @override
  String get key => 'result';
}
