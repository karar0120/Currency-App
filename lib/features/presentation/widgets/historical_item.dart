import 'package:currency_app/core/helper/strings_manger.dart';
import 'package:currency_app/features/domain/entities/currency_rate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HistoricalItem extends StatelessWidget {
  final CurrencyRate currencyRate;
  const HistoricalItem({super.key, required this.currencyRate});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(6.r)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${AppString.time} ${currencyRate.date}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '1.0',
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
