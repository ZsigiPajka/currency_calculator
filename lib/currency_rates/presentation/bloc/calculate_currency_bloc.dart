
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/CurrencyRates.dart';
import 'dart:developer' as developer;


part 'calculate_currency_event.dart';
part 'calculate_currency_state.dart';

class CalculateCurrencyBloc extends Bloc<CalculateCurrencyEvent, CalculateCurrencyState> {
  CalculateCurrencyBloc() : super(const Initial('-1')) {
    on<GetCurrencyResult>(onCalculateCurrencyEvent);
  }

  void onCalculateCurrencyEvent(GetCurrencyResult getCurrencyResult, Emitter <CalculateCurrencyState> emit){
    double result;
    List<InnerCube> rates = getCurrencyResult.rates;
    InnerCube ? fromCurrencyObject = rates.firstWhere((rate) => rate.currency == getCurrencyResult.currencies[0]);
    InnerCube ? toCurrencyObject = rates.firstWhere((rate) => rate.currency == getCurrencyResult.currencies[1]);
    double fromRate = double.parse(fromCurrencyObject.rate == null ? "-1": fromCurrencyObject.rate!);
    double toRate = double.parse(fromCurrencyObject.rate == null ? "-1": toCurrencyObject.rate!);
    if(toRate == -1 || fromRate == -1){
      result = -1;
    }else {
      result = double.parse(getCurrencyResult.values[0]) / fromRate * toRate;
    }
    emit(
      CalculatedCurrency(result.toString())
    );
  }
}
