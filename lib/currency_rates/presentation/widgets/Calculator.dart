import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../data/models/CurrencyRates.dart';
import '../bloc/calculate_currency_bloc.dart';
import 'CurrencyInput.dart';

class Calculator extends StatefulWidget {
  final List<InnerCube> rates;

  const Calculator({super.key, required this.rates});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  late List<InnerCube> list = widget.rates
      .where((element) => element.currency != null && element.rate != null)
      .toList();
  List<CurrencyInput> _currencyForms = [];
  List<TextEditingController> _inputContent = [];

  @override
  void initState() {
    _inputContent.add(TextEditingController());
    _inputContent.add(TextEditingController());
    _currencyForms.add(CurrencyInput(
        rates: list,
        dropdownValue: ValueNotifier<String>(list.first.currency!),
        inputController: _inputContent[0]));
    _currencyForms.add(CurrencyInput(
        rates: list,
        dropdownValue: ValueNotifier<String>(list[1].currency!),
        inputController: _inputContent[1]));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (c, o) {
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.onBackground,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          toolbarHeight: 30.sp,
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text("Menová kalkulačka",
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontSize: 20.sp,
                color: Theme.of(context).colorScheme.onPrimary,
              )),
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.all(20.sp),
                child: Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context).colorScheme.shadow,
                            spreadRadius: 3,
                            blurRadius: 7,
                            offset: const Offset(0, 8), // changes position of shadow
                          ),
                        ],
                        borderRadius:
                        const BorderRadius.all(Radius.circular(20)),
                        color: Theme.of(context).colorScheme.onPrimary),
                    alignment: Alignment.center,
                    child: Column(children: [
                      SizedBox(
                        height: 20.sp,
                      ),
                      BlocListener<CalculateCurrencyBloc,
                          CalculateCurrencyState>(
                          listener: (_, state) {
                            if (state is CalculatedCurrency) {
                              _inputContent[1].text = state.result;
                            }
                          },
                          child: Container(
                              constraints: BoxConstraints(maxWidth: 100.w),
                              child: Flex(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  direction: 100.w >= 100.h
                                      ? Axis.horizontal
                                      : Axis.vertical,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text("Suma"),
                                          SizedBox(
                                            height: 5.sp,
                                          ),
                                          _currencyForms[0],
                                        ]),
                                    SizedBox(
                                        width: 24.sp,
                                        height: 28.sp,
                                        child: InkWell(
                                          borderRadius:
                                          BorderRadius.circular(100),
                                          onTap: () {
                                            setState(() {
                                              _inputContent = _inputContent
                                                  .reversed
                                                  .toList();
                                              _currencyForms = _currencyForms
                                                  .reversed
                                                  .toList();
                                            });
                                          },
                                          child: Icon(
                                            Icons.sync_alt,
                                            size: 20.sp,
                                          ),
                                        )),
                                    Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text("Prepočet"),
                                          SizedBox(
                                            height: 5.sp,
                                          ),
                                          _currencyForms[1],
                                        ])
                                  ]))),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ValueListenableBuilder<String>(
                              valueListenable: _currencyForms[0].dropdownValue,
                              builder:
                                  (BuildContext context, String value, child) {
                                double rate = double.parse(list
                                    .firstWhere((e) =>
                                e.currency ==
                                    _currencyForms[1]
                                        .dropdownValue
                                        .value)
                                    .rate!) /
                                    double.parse(list
                                        .firstWhere((e) => e.currency == value)
                                        .rate!);
                                return Text(
                                    "1.0000 $value = ${rate.toStringAsFixed(4)} ${_currencyForms[1].dropdownValue.value}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge
                                        ?.copyWith(
                                      fontSize: 14.sp,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .shadow,
                                    ));
                              },
                            ),
                            TextButton(
                              onPressed: () {
                                BlocProvider.of<CalculateCurrencyBloc>(context)
                                    .add(GetCurrencyResult(widget.rates, [
                                  _inputContent[0].text,
                                  _inputContent[1].text
                                ], [
                                  _currencyForms[0].dropdownValue.value,
                                  _currencyForms[1].dropdownValue.value
                                ]));
                              },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                  color:
                                  Theme.of(context).colorScheme.onSurface,
                                ),
                                constraints: BoxConstraints(minWidth: 50),
                                width: 48.sp,
                                height: 23.sp,
                                child: Text(
                                  "Prepočítať",
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge
                                      ?.copyWith(
                                    fontSize: 17.sp,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary,
                                  ),
                                ),
                              ),
                            )
                          ]),
                      SizedBox(
                        height: 5.h,
                      )
                    ])))), // This trailing comma makes auto-formatting nicer for build methods.
      );
    });
  }
}

