import 'package:bloc/bloc.dart';
import 'package:currency_app/features/domain/usecases/get_all_currency.dart';
import 'package:currency_app/features/domain/usecases/get_conversion_rate.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'conversion_state.dart';
part '../conversion_cubit.freezed.dart';

class ConversionCubit extends Cubit<ConversionState> {
  final GetConversionRate getConversionRate;
  final GetAllCurrency getAllCurrency;
  ConversionCubit(
      {required this.getConversionRate, required this.getAllCurrency})
      : super(const ConversionState.initial());
}
