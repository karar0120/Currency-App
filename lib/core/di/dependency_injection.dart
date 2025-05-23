import 'package:currency_app/core/networking/api_service.dart';
import 'package:currency_app/core/networking/dio_factory.dart';
import 'package:currency_app/core/networking/netwotk_info.dart';
import 'package:currency_app/features/data/datasources/currency_remote_datasource.dart';
import 'package:currency_app/features/data/repositories/currency_repository_impl.dart';
import 'package:currency_app/features/domain/repositories/currency_repository.dart';
import 'package:currency_app/features/domain/usecases/get_all_currency.dart';
import 'package:currency_app/features/domain/usecases/get_conversion_rate.dart';
import 'package:currency_app/features/presentation/cubit/conversion/conversion_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  getIt.registerLazySingleton<NetworkInfo>(() =>
      NetworkInfoImpl(internetConnectionChecker: InternetConnectionChecker()));

  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  getIt.registerLazySingleton<CurrencyRemoteDataSource>(
      () => CurrencyRemoteDataSource(getIt<ApiService>()));

  //get currency repository

  getIt.registerLazySingleton<CurrencyRepository>(() => CurrencyRepositoryImpl(
        getIt<CurrencyRemoteDataSource>(),
      ));
}

Future<void> initConvertModule() async {
  if (!GetIt.I.isRegistered<GetConversionRate>()) {
    getIt.registerFactory<GetConversionRate>(() => GetConversionRate(
          repository: getIt(),
        ));
    getIt.registerFactory<GetAllCurrency>(() => GetAllCurrency(
          repository: getIt(),
        ));
    getIt.registerFactory<ConversionCubit>(() => ConversionCubit(
        getConversionRate: getIt<GetConversionRate>(),
        getAllCurrency: getIt<GetAllCurrency>()));
  }
}
