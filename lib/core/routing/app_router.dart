import 'package:currency_app/core/di/dependency_injection.dart';
import 'package:currency_app/core/helper/constances.dart';
import 'package:currency_app/core/routing/routes.dart';
import 'package:currency_app/features/data/models/conversion_request_model.dart';
import 'package:currency_app/features/presentation/cubit/conversion/conversion_cubit.dart';
import 'package:currency_app/features/presentation/cubit/currency/currency_cubit.dart';
import 'package:currency_app/features/presentation/cubit/historical_rates/historical_rates_cubit.dart';
import 'package:currency_app/features/presentation/screens/conversion_screen.dart';
import 'package:currency_app/features/presentation/screens/historical_screen.dart';

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
      case Routes.historyScreen:
        initHistoricalModule();
        final argment = settings.arguments as ConversionRequestModel;
        return MaterialPageRoute(
            builder: (context) => BlocProvider<HistoricalRatesCubit>(
                  create: (context) => getIt<HistoricalRatesCubit>(),
                  child: HistoricalScreen(
                    request: argment,
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
