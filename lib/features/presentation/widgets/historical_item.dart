import 'package:currency_app/core/helper/spacing.dart';
import 'package:currency_app/core/helper/strings_manger.dart';
import 'package:currency_app/core/helper/values_manger.dart';
import 'package:currency_app/features/domain/entities/currency_rate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HistoricalItem extends StatelessWidget {
  final CurrencyRate currencyRate;
  const HistoricalItem({super.key, required this.currencyRate});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: AppSize.s5,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s5.r)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${AppString.time} ${currencyRate.date}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            verticalSpace(AppSize.s8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppSize.s1.toString(),
                ),
                Row(
                  children: [
                    Text(currencyRate.base,
                        style: const TextStyle(color: Colors.blueGrey)),
                    const Icon(Icons.arrow_forward, color: Colors.blueGrey),
                    Text(" ${currencyRate.currency.toString()} ",
                        style: const TextStyle(color: Colors.red)),
                  ],
                ),
                Text(
                  currencyRate.rate.toString(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
