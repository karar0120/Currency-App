import 'dart:async';
import 'package:currency_app/core/helper/spacing.dart';
import 'package:currency_app/core/helper/values_manger.dart';
import 'package:currency_app/features/presentation/widgets/currency_convert_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/helper/strings_manger.dart';
import '../../data/models/conversion_request_model.dart';
import '../cubit/conversion/conversion_cubit.dart';
import '../widgets/calculate_button.dart';
import '../widgets/conversion_result.dart';
import '../widgets/currency_input_section.dart';
import '../widgets/swap_button.dart';

class CurrencyConverterPage extends StatefulWidget {
  const CurrencyConverterPage({super.key});

  @override
  State<CurrencyConverterPage> createState() => _CurrencyConverterPageState();
}

class _CurrencyConverterPageState extends State<CurrencyConverterPage> {
  String? fromCurrency;
  String? toCurrency;
  final TextEditingController amountController = TextEditingController();
  final TextEditingController convertedAmountController =
      TextEditingController();
  Timer? _debounceTimer;
  static const _debounceDuration = Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    amountController.addListener(_onAmountChanged);
  }

  @override
  void dispose() {
    amountController.removeListener(_onAmountChanged);
    amountController.dispose();
    convertedAmountController.dispose();
    _debounceTimer?.cancel();
    super.dispose();
  }

  void _onAmountChanged() {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(_debounceDuration, () {
      _convertCurrency();
    });
  }

  void _convertCurrency() {
    final amount = double.tryParse(amountController.text.trim());
    if (fromCurrency == null || toCurrency == null || amount == null) return;

    context.read<ConversionCubit>().getConversion(
          ConversionRequestModel(
              from: fromCurrency!, to: toCurrency!, amount: amount),
        );
  }

  void _swapCurrencies() {
    if (fromCurrency == null || toCurrency == null) return;

    setState(() {
      final temp = fromCurrency;
      fromCurrency = toCurrency;
      toCurrency = temp;
      amountController.text = convertedAmountController.text;
    });

    _convertCurrency();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ConversionCubit, ConversionState>(
      listener: (context, state) {
        state.whenOrNull(success: (result) {
          convertedAmountController.text = result.toStringAsFixed(2);
        });
      },
      child: Scaffold(
        appBar: CurrencyConvertAppBar(
            fromCurrency: fromCurrency, toCurrency: toCurrency),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p20.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(AppSize.s50),
                const Text(AppString.amount),
                verticalSpace(AppSize.s8),
                CurrencyInputSection(
                  label: AppString.currency,
                  selectedCurrency: fromCurrency,
                  onCurrencyChanged: (val) =>
                      setState(() => fromCurrency = val),
                  controller: amountController,
                ),
                verticalSpace(AppSize.s16),
                SwapButton(onPressed: _swapCurrencies),
                const Text(AppString.convertdAmount),
                verticalSpace(AppSize.s8),
                CurrencyInputSection(
                  label: AppString.currency,
                  selectedCurrency: toCurrency,
                  onCurrencyChanged: (val) => setState(() => toCurrency = val),
                  controller: convertedAmountController,
                ),
                verticalSpace(AppSize.s16),
                ConversionResult(
                  toCurrency: toCurrency,
                ),
                verticalSpace(AppSize.s16),
                CalculateButton(onPressed: _convertCurrency),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
