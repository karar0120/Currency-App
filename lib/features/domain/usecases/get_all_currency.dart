import 'package:currency_app/core/helper/base_use_case.dart';
import 'package:currency_app/core/networking/api_result.dart';
import 'package:currency_app/features/domain/entities/currency.dart';
import 'package:currency_app/features/domain/repositories/currency_repository.dart';

class GetAllCurrency extends BaseUseCase<void, List<Currency>> {
  CurrencyRepository repository;

  GetAllCurrency({required this.repository});
  @override
  Future<ApiResult<List<Currency>>> execute(input) async {
    return await repository.getCurrencies();
  }
}
