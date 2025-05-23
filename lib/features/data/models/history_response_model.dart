import 'package:json_annotation/json_annotation.dart';

part 'history_response_model.g.dart';

@JsonSerializable()
class HistoryResponseModel {
  final String base;
  final String startDate;
  final String endDate;
  final Map<String, Map<String, double>> rates;

  HistoryResponseModel({
    required this.base,
    required this.startDate,
    required this.endDate,
    required this.rates,
  });

  factory HistoryResponseModel.fromJson(Map<String, dynamic> json) =>
      _$HistoryResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryResponseModelToJson(this);
}
