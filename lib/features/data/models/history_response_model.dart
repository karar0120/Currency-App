import 'package:json_annotation/json_annotation.dart';

part 'history_response_model.g.dart';

@JsonSerializable()
class HistoryResponseModel {
  final String base;
  final String date;
  final Map<String, double> results;

  HistoryResponseModel({
    required this.base,
    required this.date,
    required this.results,
  });

  factory HistoryResponseModel.fromJson(Map<String, dynamic> json) =>
      _$HistoryResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryResponseModelToJson(this);
}
