import 'package:currency_app/core/helper/strings_manger.dart';
import 'package:currency_app/core/widget/app_bar.dart';
import 'package:currency_app/features/presentation/cubit/currency/currency_cubit.dart';
import 'package:currency_app/features/presentation/widgets/currency_converter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConversionScreen extends StatelessWidget {
  const ConversionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const GeneralAppBar(
          title: Text(AppString.currencyExchange),
          leading: Icon(
            Icons.history,
            color: Colors.white,
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<CurrencyCubit, CurrencyState>(
          builder: (context, state) {
            return const CurrencyConverterPage();
          },
        ));
  }
}
