import 'package:currency_info_app_prac/data/data_source/currency_api.dart';
import 'package:currency_info_app_prac/data/repository/currency_repository_impl.dart';
import 'package:currency_info_app_prac/domain/repository/currency_repository.dart';
import 'package:currency_info_app_prac/domain/use_case/get_currency_use_case.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void diSetup() {
  getIt.registerLazySingleton<CurrencyApi>(() => CurrencyApi());

  getIt.registerLazySingleton<CurrencyRepository>(
      () => CurrencyRepositoryImpl(getIt<CurrencyApi>()));

  getIt.registerLazySingleton<GetCurrencyUseCase>(
      () => GetCurrencyUseCase(getIt<CurrencyRepository>()));
}
