


import '../../../../utils/resources/data_state.dart';
import '../../data/models/CurrencyRates.dart';

abstract class RatesApiRepository{

  Future<DataState<CurrencyRates>> getCurrencyRates();
}
