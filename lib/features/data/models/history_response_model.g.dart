// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryResponseModel _$HistoryResponseModelFromJson(
        Map<String, dynamic> json) =>
    HistoryResponseModel(
      base: json['base'] as String,
      startDate: json['startDate'] as String,
      endDate: json['endDate'] as String,
      rates: (json['rates'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            k,
            (e as Map<String, dynamic>).map(
              (k, e) => MapEntry(k, (e as num).toDouble()),
            )),
      ),
    );

Map<String, dynamic> _$HistoryResponseModelToJson(
        HistoryResponseModel instance) =>
    <String, dynamic>{
      'base': instance.base,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'rates': instance.rates,
    };
