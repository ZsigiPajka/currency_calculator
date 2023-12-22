part of 'currency_rates_bloc.dart';

abstract class CurrencyRatesEvent extends Equatable {
  const CurrencyRatesEvent();

  @override
  List<Object?> get props => [];
}

class GetCurrencyRates extends CurrencyRatesEvent{
   const GetCurrencyRates();
}
