import 'package:freezed_annotation/freezed_annotation.dart';

part 'conversion_response_model.g.dart';

@JsonSerializable()
class ConversionResponseModel {
  final String base;
  final num amount;
  final Map<String, dynamic> result;

  ConversionResponseModel({
    required this.base,
    required this.amount,
    required this.result,
  });

  factory ConversionResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ConversionResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConversionResponseModelToJson(this);

  num? getRate(String toCurrency) {
    return result[toCurrency] as num?;
  }
}
