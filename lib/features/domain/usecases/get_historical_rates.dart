import 'package:currency_app/core/helper/base_use_case.dart';
import 'package:currency_app/core/networking/api_result.dart';
import 'package:currency_app/features/data/models/conversion_request_model.dart';
import 'package:currency_app/features/domain/entities/currency_rate.dart';
import 'package:currency_app/features/domain/repositories/currency_repository.dart';

class GetHistoricalRates
    extends BaseUseCase<ConversionRequestModel, List<CurrencyRate>> {
  CurrencyRepository repository;

  GetHistoricalRates({required this.repository});
  @override
  Future<ApiResult<List<CurrencyRate>>> execute(input) async {
    return await repository.getHistoricalRates(request: input);
  }
}
