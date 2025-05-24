import 'package:currency_app/features/data/models/conversion_response_model.dart';
import 'package:currency_app/features/data/models/currency_response_model.dart';
import 'package:currency_app/features/data/models/history_response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'api_constants.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET(ApiConstants.convert)
  Future<ConversionResponseModel> getConversionRate(
    @Query("api_key") String apiKey,
    @Query("from") String from,
    @Query("to") String to,
    @Query("amount") num amount,
  );
  @GET(ApiConstants.historical)
  Future<HistoryResponseModel> getHistoricalRates(
    @Query("date") String date,
    @Query("api_key") String apiKey,
  );

  @GET(ApiConstants.allCurrencies)
  Future<CurrencyResponseModel> getAllCurrency(
    @Query("api_key") String apiKey,
  );
}
