import 'package:currency_app/core/di/dependency_injection.dart';
import 'package:currency_app/core/helper/constances.dart';
import 'package:currency_app/core/routing/routes.dart';
import 'package:currency_app/features/presentation/cubit/conversion/conversion_cubit.dart';
import 'package:currency_app/features/presentation/cubit/currency/currency_cubit.dart';
import 'package:currency_app/features/presentation/screens/conversion_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.convertScreen:
        initCurrencyModule();
        initConvertModule();
        return MaterialPageRoute(
            builder: (context) => BlocProvider<CurrencyCubit>(
                  create: (context) => getIt<CurrencyCubit>()..getCurrency(),
                  child: BlocProvider<ConversionCubit>(
                    create: (context) => getIt<ConversionCubit>(),
                    child: const ConversionScreen(),
                  ),
                ));
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(Constances.noRouteFound),
              ),
              body: const Center(child: Text(Constances.noRouteFound)),
            ));
  }
}
