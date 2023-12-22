import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/currency_rates_bloc.dart';
import '../widgets/Calculator.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrencyRatesBloc, CurrencyRatesState>(
        builder: (_, state) {
          if (state is CurrencyRatesSuccess) {
            return Calculator(rates: state.rates!);
          }
          return Container();
        });
  }
}
