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
      result: Result.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ConversionResponseModelToJson(
        ConversionResponseModel instance) =>
    <String, dynamic>{
      'base': instance.base,
      'amount': instance.amount,
      'result': instance.result,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      rate: json['rate'] as num?,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'rate': instance.rate,
    };
