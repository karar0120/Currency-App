import 'package:currency_app/core/helper/strings_manger.dart';
import 'package:currency_app/core/widget/app_bar.dart';
import 'package:currency_app/features/data/models/conversion_request_model.dart';
import 'package:currency_app/features/presentation/cubit/historical_rates/historical_rates_cubit.dart';
import 'package:currency_app/features/presentation/widgets/historical_rates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoricalScreen extends StatefulWidget {
  final ConversionRequestModel request;
  const HistoricalScreen({super.key, required this.request});

  @override
  State<HistoricalScreen> createState() => _HistoricalScreenState();
}

class _HistoricalScreenState extends State<HistoricalScreen> {
  @override
  void initState() {
    super.initState();
    final cubit = context.read<HistoricalRatesCubit>();
    cubit.getHistorical(ConversionRequestModel(
        from: widget.request.from, to: widget.request.to));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: GeneralAppBar(
        title: Text(AppString.history),
        centerTitle: true,
      ),
      body: HistoricalRatesView(),
    );
  }
}
