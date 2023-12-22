part of 'calculate_currency_bloc.dart';

abstract class CalculateCurrencyEvent extends Equatable {
  final List<InnerCube> rates;
  final List<String> values;
  final List<String> currencies;
  const CalculateCurrencyEvent(this.rates, this.values, this.currencies);

  @override
  List<Object?> get props => [rates, values, currencies];
}

class GetCurrencyResult extends CalculateCurrencyEvent{
  const GetCurrencyResult(super.rates, super.values, super.currencies);

}
