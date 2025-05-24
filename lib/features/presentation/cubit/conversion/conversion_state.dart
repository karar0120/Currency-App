part of 'conversion_cubit.dart';

@freezed
class ConversionState<T> with _$ConversionState<T> {
  const factory ConversionState.initial() = _Initial;

  const factory ConversionState.loading() = Loading;

  const factory ConversionState.success(T data) = Success<T>;

  const factory ConversionState.error({required String error}) = Error;
}
