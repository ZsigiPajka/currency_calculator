import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:currency_calculator/currency_rates/domain/use_cases/get_currency_rates.dart';
import 'package:currency_calculator/utils/resources/data_state.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import 'dart:developer' as developer;

import '../../data/models/CurrencyRates.dart';


part 'currency_rates_event.dart';
part 'currency_rates_state.dart';

class CurrencyRatesBloc extends Bloc<CurrencyRatesEvent, CurrencyRatesState> {
  final GetRatesUseCase _getRatesUseCase;

  CurrencyRatesBloc(this._getRatesUseCase)
      : super(const CurrencyRatesLoading()) {
    on<GetCurrencyRates>(onGetCurrencyRates);
  }

  Future<void> onGetCurrencyRates(GetCurrencyRates getCurrencyRates, Emitter <CurrencyRatesState> emit) async {
    final dataState = await _getRatesUseCase();
    if(dataState is DataSuccess){
      if(dataState.data?.envelope?.cube?.cube?.cube != null) {
        dataState.data!.envelope!.cube!.cube!.cube!.insert(0, InnerCube(rate: "1.0", currency: "EUR"));
        emit(
            CurrencyRatesSuccess(dataState.data!.envelope!.cube!.cube!.cube)
        );
      }else{
        emit(
          const CurrencyRatesFailed()
        );
      }
    }

    if(dataState is DataFailed){
      emit(
        CurrencyRatesFailed(error: dataState.error)
      );
    }

  }
}

