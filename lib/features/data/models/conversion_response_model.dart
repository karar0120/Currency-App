import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'conversion_response_model.g.dart';

@JsonSerializable()
class ConversionResponseModel {
  final String base;
  final num amount;
  final Result result;

  ConversionResponseModel({
    required this.base,
    required this.amount,
    required this.result,
  });

  factory ConversionResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ConversionResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConversionResponseModelToJson(this);
}

@JsonSerializable()
class Result {
  num? rate;

  Result({required this.rate});

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}
