import 'package:currency_app/core/networking/api_result.dart';
import 'package:currency_app/features/domain/entities/currency.dart';
import 'package:currency_app/features/domain/entities/currency_rate.dart';

abstract class CurrencyRepository {
  Future<ApiResult<List<Currency>>> getCurrencies();
  Future<ApiResult<CurrencyRate>> getConversionRate();

  Future<ApiResult<List<CurrencyRate>>> getHistoricalRates();
}
