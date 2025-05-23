import 'package:currency_app/core/helper/base_use_case.dart';
import 'package:currency_app/core/networking/api_result.dart';
import 'package:currency_app/features/domain/entities/currency_rate.dart';
import 'package:currency_app/features/domain/repositories/currency_repository.dart';

class GetConversionRate extends BaseUseCase<void, CurrencyRate> {
  CurrencyRepository repository;

  GetConversionRate({required this.repository});
  @override
  Future<ApiResult<CurrencyRate>> execute(input) async {
    return await repository.getConversionRate();
  }
}
