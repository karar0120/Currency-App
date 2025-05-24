import 'package:currency_app/core/networking/api_constants.dart';
import 'package:currency_app/core/networking/api_service.dart';
import 'package:currency_app/features/data/models/conversion_request_model.dart';
import 'package:currency_app/features/data/models/currency_response_model.dart';
import '../models/conversion_response_model.dart';
import '../models/history_response_model.dart';

class CurrencyRemoteDataSource {
  final ApiService api;

  CurrencyRemoteDataSource(this.api);

  Future<ConversionResponseModel> getConversionRate(
      ConversionRequestModel request) async {
    return await api.getConversionRate(
      ApiConstants.apiKey,
      request.from,
      request.to,
      request.amount,
    );
  }

  Future<HistoryResponseModel> getHistoricalRates() async {
    return await api.getHistoricalRates(
      ApiConstants.apiKey,
      "USD",
    );
  }

  Future<CurrencyResponseModel> getAllCurrency() async {
    return await api.getAllCurrency(ApiConstants.apiKey);
  }
}
