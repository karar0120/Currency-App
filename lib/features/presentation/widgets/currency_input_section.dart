import 'package:currency_app/features/presentation/cubit/currency/currency_cubit.dart';
import 'package:currency_app/features/presentation/widgets/amount_text_filed.dart';
import 'package:currency_app/features/presentation/widgets/currency_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrencyInputSection extends StatelessWidget {
  final String label;
  final String? selectedCurrency;
  final ValueChanged<String?> onCurrencyChanged;
  final TextEditingController controller;

  const CurrencyInputSection({
    super.key,
    required this.label,
    required this.selectedCurrency,
    required this.onCurrencyChanged,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrencyCubit, CurrencyState>(
      builder: (context, state) {
        return state.when(
          initial: () => const CircularProgressIndicator(),
          loading: () => const CircularProgressIndicator(),
          error: (error) => Text(
            'Error loading currencies: $error',
            style: const TextStyle(color: Colors.red),
          ),
          success: (currencies) => Row(
            children: [
              Flexible(
                child: CurrencySelector(
                  onChanged: onCurrencyChanged,
                  currencies: currencies,
                  label: label,
                  selectedCurrency: selectedCurrency,
                ),
              ),
              SizedBox(width: 16.w),
              Flexible(
                child: AmountTextField(controller: controller),
              ),
            ],
          ),
        );
      },
    );
  }
}
