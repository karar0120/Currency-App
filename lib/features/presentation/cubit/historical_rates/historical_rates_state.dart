part of 'historical_rates_cubit.dart';

@freezed
class HistoricalRatesState<T> with _$HistoricalRatesState<T> {
  const factory HistoricalRatesState.initial() = _Initial;

  const factory HistoricalRatesState.loading() = Loading;

  const factory HistoricalRatesState.success(T data) = Success<T>;

  const factory HistoricalRatesState.error({required String error}) = Error;
}
