import 'package:currency_app/core/helper/strings_manger.dart';
import 'package:currency_app/core/helper/values_manger.dart';
import 'package:currency_app/core/routing/routes.dart';
import 'package:currency_app/core/widget/app_bar.dart';
import 'package:currency_app/features/data/models/conversion_request_model.dart';
import 'package:flutter/material.dart';

class CurrencyConvertAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CurrencyConvertAppBar({
    super.key,
    required this.fromCurrency,
    required this.toCurrency,
  });

  final String? fromCurrency;
  final String? toCurrency;

  @override
  Widget build(BuildContext context) {
    return GeneralAppBar(
      title: const Text(AppString.currencyExchange),
      leading: InkWell(
        onTap: () => Navigator.pushNamed(context, Routes.historyScreen,
            arguments: ConversionRequestModel(
              from: fromCurrency ?? "",
              to: toCurrency ?? "",
            )),
        child: const Icon(
          Icons.history,
          color: Colors.white,
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(AppSize.s80);
}
