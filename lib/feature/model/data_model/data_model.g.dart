// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataModel _$DataModelFromJson(Map<String, dynamic> json) => DataModel(
      version: json['Version'] as String?,
      statusCode: (json['StatusCode'] as num?)?.toInt(),
      isSuccess: json['IsSuccess'] as bool?,
      result: json['Result'] == null
          ? null
          : ResultModel.fromJson(json['Result'] as Map<String, dynamic>),
      message: json['Message'] as String?,
    );

Map<String, dynamic> _$DataModelToJson(DataModel instance) => <String, dynamic>{
      'Version': instance.version,
      'IsSuccess': instance.isSuccess,
      'Result': instance.result,
      'Message': instance.message,
      'StatusCode': instance.statusCode,
    };
