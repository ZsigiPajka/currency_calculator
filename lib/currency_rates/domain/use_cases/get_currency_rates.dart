

import '../../../../utils/resources/data_state.dart';
import '../../../../utils/usecase/usecase.dart';
import '../../data/models/CurrencyRates.dart';
import '../repositories/api_repository.dart';

class GetRatesUseCase implements UseCase<DataState<CurrencyRates>, void>{
  final RatesApiRepository _apiRepository;
  GetRatesUseCase(this._apiRepository);


  @override
  Future<DataState<CurrencyRates>> call({void params}) {
    return _apiRepository.getCurrencyRates();
  }

}
