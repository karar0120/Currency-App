import 'package:bloc/bloc.dart';
import 'package:currency_app/features/domain/usecases/get_all_currency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'currency_state.dart';
part 'currency_cubit.freezed.dart';

class CurrencyCubit extends Cubit<CurrencyState> {
  GetAllCurrency getAllCurrency;
  CurrencyCubit({
    required this.getAllCurrency,
  }) : super(const CurrencyState.initial());

  Future<void> getCurrency() async {
    emit(const CurrencyState.loading());
    final response = await getAllCurrency.execute(null);
    response.when(success: (currency) {
      emit(CurrencyState.success(currency));
    }, failure: (error) {
      emit(CurrencyState.error(error: error.apiErrorModel.title ?? " "));
    });
  }
}
