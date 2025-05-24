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
  Future<ApiResult<List<CurrencyRate>>> getHistoricalRates() async {
    try {
      // final response = await remote.getHistoricalRates();

      final List<CurrencyRate> rates = [];

      // response.rates.forEach((date, rateMap) {
      //   final rate = rateMap[symbols] ?? 0.0;
      //   rates.add(CurrencyRate(
      //     base: response.base,
      //     target: symbols,
      //     rate: rate,
      //     date: date,
      //   ));
      // });

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
