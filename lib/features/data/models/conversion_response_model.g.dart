// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversion_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConversionResponseModel _$ConversionResponseModelFromJson(
        Map<String, dynamic> json) =>
    ConversionResponseModel(
      base: json['base'] as String,
      amount: json['amount'] as num,
      result: json['result'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$ConversionResponseModelToJson(
        ConversionResponseModel instance) =>
    <String, dynamic>{
      'base': instance.base,
      'amount': instance.amount,
      'result': instance.result,
    };
