part of 'currency_rates_bloc.dart';

abstract class CurrencyRatesState extends Equatable {
  final  List<InnerCube>? rates;
  final DioException? error;

  const CurrencyRatesState({this.rates, this.error});

  @override
  List<Object> get props{
    if(rates != null){
      return [rates!];
    }else{
      return [];
    }
  }
}

class CurrencyRatesLoading extends CurrencyRatesState{
  const CurrencyRatesLoading();
}

class CurrencyRatesSuccess extends CurrencyRatesState {
  const CurrencyRatesSuccess(List<InnerCube>? rates) : super(rates: rates);
}

class CurrencyRatesFailed extends CurrencyRatesState{
  const CurrencyRatesFailed({DioException ? error}) : super(error: error);
}
