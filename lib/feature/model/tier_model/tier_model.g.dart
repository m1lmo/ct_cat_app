// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tier_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TierModel _$TierModelFromJson(Map<String, dynamic> json) => TierModel(
      tierName: json['tierName'] as String?,
      minPoint: (json['minPoint'] as num?)?.toInt(),
      maxPoint: (json['maxPoint'] as num?)?.toInt(),
      seqNo: (json['seqNo'] as num?)?.toInt(),
      fontColor: json['fontColor'] as String?,
      bgColor: json['bgColor'] as String?,
      widgets: json['widgets'],
    );

Map<String, dynamic> _$TierModelToJson(TierModel instance) => <String, dynamic>{
      'tierName': instance.tierName,
      'minPoint': instance.minPoint,
      'maxPoint': instance.maxPoint,
      'seqNo': instance.seqNo,
      'fontColor': instance.fontColor,
      'bgColor': instance.bgColor,
      'widgets': instance.widgets,
    };
