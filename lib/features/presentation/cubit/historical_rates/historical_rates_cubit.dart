import 'package:bloc/bloc.dart';
import 'package:currency_app/features/data/models/conversion_request_model.dart';
import 'package:currency_app/features/domain/usecases/get_historical_rates.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'historical_rates_state.dart';
part 'historical_rates_cubit.freezed.dart';

class HistoricalRatesCubit extends Cubit<HistoricalRatesState> {
  final GetHistoricalRates getHistoricalRates;
  HistoricalRatesCubit({
    required this.getHistoricalRates,
  }) : super(const HistoricalRatesState.initial());

  Future<void> getHistorical(ConversionRequestModel input) async {
    emit(const HistoricalRatesState.loading());
    final response = await getHistoricalRates.execute(ConversionRequestModel(
      from: input.from,
      to: input.to,
    ));
    response.when(success: (conversionRate) {
      emit(HistoricalRatesState.success(conversionRate));
    }, failure: (error) {
      emit(HistoricalRatesState.error(error: error.apiErrorModel.title ?? " "));
    });
  }
}
