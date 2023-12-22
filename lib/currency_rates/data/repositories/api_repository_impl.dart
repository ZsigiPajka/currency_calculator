

import 'package:currency_calculator/currency_rates/data/data_sources/currency_rates_service.dart';

import '../../../../utils/resources/data_state.dart';
import '../../domain/repositories/api_repository.dart';
import '../models/CurrencyRates.dart';
import 'base/BaseApiRepository.dart';

class CurrencyRatesRepositoryImpl extends BaseApiRepository implements  RatesApiRepository{
  final CurrencyRatesService _currencyRatesService;

  CurrencyRatesRepositoryImpl(this._currencyRatesService);

  @override
  Future<DataState<CurrencyRates>> getCurrencyRates() {
    return getStateOf<CurrencyRates>(
        request: () => _currencyRatesService.getRates()
    );
  }
  
}