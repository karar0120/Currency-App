import 'package:currency_app/core/networking/api_error_handler.dart';
import 'package:currency_app/core/networking/api_result.dart';
import 'package:currency_app/features/data/models/conversion_request_model.dart';
import 'package:currency_app/features/domain/entities/currency.dart';

import '../../domain/entities/currency_rate.dart';
import '../../domain/repositories/currency_repository.dart';
import '../datasources/currency_remote_datasource.dart';

class CurrencyRepositoryImpl implements CurrencyRepository {
  final CurrencyRemoteDataSource remote;

  CurrencyRepositoryImpl(this.remote);

  @override
  Future<ApiResult<CurrencyRate>> getConversionRate(
      {required ConversionRequestModel request}) async {
    try {
      final response = await remote.getConversionRate(request);

      return ApiResult.success(
        CurrencyRate(
          base: response.base,
          rate: response.result[request.to] ?? 0.0,
        ),
      );
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<List<CurrencyRate>>> getHistoricalRates(
      {required ConversionRequestModel request}) async {
    try {
      final response = await remote.getHistoricalRates(request);
      final rates = response.results.entries.map((entry) {
        return CurrencyRate(
          date: response.date,
          base: response.base,
          currency: entry.key,
          rate: entry.value,
        );
      }).toList();

      return ApiResult.success(rates);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<List<Currency>>> getCurrencies() async {
    try {
      final response = await remote.getAllCurrency();
      return ApiResult.success(response.currencies);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
