import 'package:currency_app/core/networking/api_result.dart';
import 'package:currency_app/features/data/models/conversion_request_model.dart';
import 'package:currency_app/features/domain/entities/currency.dart';
import 'package:currency_app/features/domain/entities/currency_rate.dart';

abstract class CurrencyRepository {
  Future<ApiResult<List<Currency>>> getCurrencies();
  Future<ApiResult<CurrencyRate>> getConversionRate(
      {required ConversionRequestModel request});

  Future<ApiResult<List<CurrencyRate>>> getHistoricalRates(
      {required ConversionRequestModel request});
}
