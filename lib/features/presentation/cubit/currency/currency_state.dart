part of 'currency_cubit.dart';

@freezed
class CurrencyState<T> with _$CurrencyState<T> {
  const factory CurrencyState.initial() = _Initial;

  const factory CurrencyState.loading() = Loading;

  const factory CurrencyState.success(T data) = Success<T>;

  const factory CurrencyState.error({required String error}) = Error;
}
