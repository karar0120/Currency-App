import 'package:currency_app/core/helper/constances.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case Routes.animalsScreen:
      //   initAnimalsModule();
      //   return MaterialPageRoute(
      //       builder: (context) => BlocProvider<AnimalsCubit>(
      //             create: (context) => getIt<AnimalsCubit>()..refreshData(),
      //             child: const AnimalsScreen(),
      //           ));
      // case Routes.animalsDetailsScreen:
      //   initAnimalsDetailsModule();
      //   return MaterialPageRoute(
      //       builder: (context) => BlocProvider<AnimalDetailsCubit>(
      //             create: (context) => getIt<AnimalDetailsCubit>()
      //               ..getAnimalDetails(settings.arguments as int),
      //             child: const AnimalDetailsScreen(),
      //           ));

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
