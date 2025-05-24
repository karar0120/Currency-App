import 'package:bloc/bloc.dart';
import 'package:currency_app/features/data/models/conversion_request_model.dart';
import 'package:currency_app/features/domain/usecases/get_conversion_rate.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'conversion_state.dart';
part 'conversion_cubit.freezed.dart';

class ConversionCubit extends Cubit<ConversionState> {
  final GetConversionRate getConversionRate;
  ConversionCubit({required this.getConversionRate})
      : super(const ConversionState.initial());
  Future<void> getConversion(ConversionRequestModel input) async {
    emit(const ConversionState.loading());
    final response = await getConversionRate.execute(ConversionRequestModel(
      from: input.from,
      to: input.to,
      amount: input.amount,
    ));
    response.when(success: (conversionRate) {
      emit(ConversionState.success(conversionRate.rate));
    }, failure: (error) {
      emit(ConversionState.error(error: error.apiErrorModel.title ?? " "));
    });
  }
}
