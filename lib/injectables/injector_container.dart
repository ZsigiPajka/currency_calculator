
import 'package:currency_calculator/currency_rates/data/data_sources/currency_rates_service.dart';
import 'package:currency_calculator/currency_rates/data/repositories/api_repository_impl.dart';
import 'package:currency_calculator/currency_rates/domain/use_cases/get_currency_rates.dart';
import 'package:currency_calculator/currency_rates/presentation/bloc/calculate_currency_bloc.dart';
import 'package:currency_calculator/currency_rates/presentation/bloc/currency_rates_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../currency_rates/domain/repositories/api_repository.dart';
final locator = GetIt.instance;

Future<void> setup() async {
  // locator.registerSingleton<SharedPreferences>( await SharedPreferences.getInstance());

  locator.registerSingleton<Dio>(Dio());
  // locator<Dio>().options.headers['Content-Type'] = 'application/json.json';
  locator.registerSingleton<CurrencyRatesService>(CurrencyRatesService(locator()));
  locator.registerSingleton<RatesApiRepository>(CurrencyRatesRepositoryImpl(locator()));
  locator.registerSingleton<GetRatesUseCase>(GetRatesUseCase(locator()));
  locator.registerFactory(
          () => CurrencyRatesBloc(locator())
  );
  locator.registerFactory(
          () => CalculateCurrencyBloc()
  );
}