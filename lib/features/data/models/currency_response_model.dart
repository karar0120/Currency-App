import 'package:currency_app/features/domain/entities/currency.dart';

class CurrencyResponseModel {
  final List<Currency> currencies;

  CurrencyResponseModel({required this.currencies});

  factory CurrencyResponseModel.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> currenciesMap = json['currencies'];
    List<Currency> currenciesList = currenciesMap.entries
        .map((entry) => Currency(id: entry.key, name: entry.value))
        .toList();

    return CurrencyResponseModel(
      currencies: currenciesList,
    );
  }
}
