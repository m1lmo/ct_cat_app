// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultModel _$ResultModelFromJson(Map<String, dynamic> json) => ResultModel(
      cats: (json['cats'] as List<dynamic>?)
          ?.map((e) => CatModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      tiers: (json['tiers'] as List<dynamic>?)
          ?.map((e) => TierModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      currentTier: json['currentTier'] as String?,
      tierPoints: (json['tierPoints'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ResultModelToJson(ResultModel instance) =>
    <String, dynamic>{
      'cats': instance.cats,
      'tiers': instance.tiers,
      'currentTier': instance.currentTier,
      'tierPoints': instance.tierPoints,
    };
