import 'package:currency_app/core/helper/strings_manger.dart';
import 'package:currency_app/features/presentation/cubit/historical_rates/historical_rates_cubit.dart';
import 'package:currency_app/features/presentation/widgets/historical_item.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class HistoricalRatesView extends StatelessWidget {
  const HistoricalRatesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoricalRatesCubit, HistoricalRatesState>(
        builder: (context, state) {
      return state.when(
        initial: () => const SizedBox(),
        loading: () => const Center(child: CircularProgressIndicator()),
        success: (conversionRates) {
          if (conversionRates.isEmpty) {
            return const Center(child: Text(AppString.noDataAvailable));
          }
          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: conversionRates.length,
                  padding: const EdgeInsets.all(10),
                  itemBuilder: (context, index) {
                    return HistoricalItem(
                      currencyRate: conversionRates[index],
                    );
                  },
                ),
              ),
            ],
          );
        },
        error: (error) => Center(child: Text('${AppString.error}: $error')),
      );
    });
  }
}
