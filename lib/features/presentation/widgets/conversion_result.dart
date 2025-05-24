import 'package:currency_app/core/helper/strings_manger.dart';
import 'package:currency_app/core/helper/values_manger.dart';
import 'package:currency_app/features/presentation/cubit/conversion/conversion_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConversionResult extends StatelessWidget {
  final String? toCurrency;

  const ConversionResult({super.key, required this.toCurrency});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConversionCubit, ConversionState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const CircularProgressIndicator(),
          success: (conversionResult) {
            return Text(
              '${AppString.result}: ${conversionResult.toStringAsFixed(2)} $toCurrency',
              style: const TextStyle(
                fontSize: AppSize.s18,
                fontWeight: FontWeight.bold,
              ),
            );
          },
          error: (error) => Text(
            '${AppString.error}: $error',
            style: const TextStyle(color: Colors.red),
          ),
        );
      },
    );
  }
}
