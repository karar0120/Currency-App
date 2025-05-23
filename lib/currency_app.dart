import 'package:currency_app/core/helper/strings_manger.dart';
import 'package:currency_app/core/helper/values_manger.dart';
import 'package:currency_app/core/routing/app_router.dart';
import 'package:currency_app/core/routing/routes.dart';
import 'package:currency_app/core/theming/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrencyApp extends StatelessWidget {
  const CurrencyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(AppSize.s375, AppSize.s812),
      minTextAdapt: true,
      child: MaterialApp(
        title: AppString.currencyApp,
        debugShowCheckedModeBanner: false,
        theme: themeData,
        initialRoute: Routes.convertScreen,
        onGenerateRoute: AppRoute.generateRoute,
      ),
    );
  }
}
