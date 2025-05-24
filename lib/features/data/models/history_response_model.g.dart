// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryResponseModel _$HistoryResponseModelFromJson(
        Map<String, dynamic> json) =>
    HistoryResponseModel(
      base: json['base'] as String,
      date: json['date'] as String,
      results: (json['results'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
    );

Map<String, dynamic> _$HistoryResponseModelToJson(
        HistoryResponseModel instance) =>
    <String, dynamic>{
      'base': instance.base,
      'date': instance.date,
      'results': instance.results,
    };
