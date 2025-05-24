import 'package:currency_app/core/networking/api_constants.dart';
import 'package:currency_app/core/networking/api_service.dart';
import 'package:currency_app/features/data/models/conversion_request_model.dart';
import 'package:currency_app/features/data/models/currency_response_model.dart';
import '../models/conversion_response_model.dart';
import '../models/history_response_model.dart';
import 'package:intl/intl.dart';

class CurrencyRemoteDataSource {
  final ApiService api;

  CurrencyRemoteDataSource(this.api);

  Future<ConversionResponseModel> getConversionRate(
      ConversionRequestModel request) async {
    return await api.getConversionRate(
      ApiConstants.apiKey,
      request.from,
      request.to,
      request.amount!,
    );
  }

  Future<HistoryResponseModel> getHistoricalRates(
      ConversionRequestModel request) async {
    return await api.getHistoricalRates(
        ApiConstants.apiKey,
        DateFormat('yyyy-MM-dd')
            .format(DateTime.now().subtract(const Duration(days: 4))),
        request.from,
        request.to);
  }

  Future<CurrencyResponseModel> getAllCurrency() async {
    return await api.getAllCurrency(ApiConstants.apiKey);
  }
}
