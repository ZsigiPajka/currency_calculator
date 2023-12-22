part of 'calculate_currency_bloc.dart';

abstract class CalculateCurrencyState extends Equatable {
  final String result;

  const CalculateCurrencyState(this.result);
  @override
  List<Object> get props => [result];
}

class Initial extends CalculateCurrencyState{
  const Initial(super.result);
}

class CalculatedCurrency extends CalculateCurrencyState {
  const CalculatedCurrency(super.result);
}
