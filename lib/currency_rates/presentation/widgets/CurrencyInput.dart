import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utils/constants/Strings.dart';
import '../../data/models/CurrencyRates.dart';

class CurrencyInput extends StatefulWidget {
  final List<InnerCube> rates;
  final ValueNotifier<String> dropdownValue;
  final TextEditingController inputController;

  const CurrencyInput(
      {super.key,
        required this.rates,
        required this.dropdownValue,
        required this.inputController});

  @override
  State<CurrencyInput> createState() => _CurrencyInputState();
}

class _CurrencyInputState extends State<CurrencyInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 32.sp,
        constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width >=
                MediaQuery.of(context).size.height
                ? MediaQuery.of(context).size.width * 0.40
                : MediaQuery.of(context).size.width * 0.80),
        child: TextField(
            controller: widget.inputController,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                  RegExp(r'^[0-9]+(\.)?([0-9]+)?$'))
            ],
            decoration: InputDecoration(
              suffixIcon: DropdownMenu<String>(
                trailingIcon: Icon(
                  Icons.arrow_downward,
                  size: 18.sp,
                ),
                textStyle: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontSize: 18.sp,
                    color: Theme.of(context).colorScheme.shadow),
                width: MediaQuery.of(context).size.width >
                    MediaQuery.of(context).size.height
                    ? MediaQuery.of(context).size.width * 0.17
                    : MediaQuery.of(context).size.width * 0.37,
                leadingIcon: Text(
                  countryToEmoji[widget.dropdownValue.value] == null
                      ? ''
                      : countryToEmoji[widget.dropdownValue.value]!,
                  style: TextStyle(
                    fontSize: 18.sp,
                  ),
                ),
                inputDecorationTheme: const InputDecorationTheme(
                    outlineBorder: BorderSide.none, border: InputBorder.none),
                initialSelection: widget.dropdownValue.value,
                onSelected: (String? value) {
                  setState(() {
                    widget.dropdownValue.value = value!;
                  });
                },
                dropdownMenuEntries: widget.rates
                    .map<DropdownMenuEntry<String>>((InnerCube item) {
                  return DropdownMenuEntry<String>(
                      leadingIcon: Text(
                        countryToEmoji[item.currency!] == null
                            ? ''
                            : countryToEmoji[item.currency!]!,
                        style: TextStyle(fontSize: 18.sp),
                      ),
                      value: item.currency!,
                      label: item.currency!,
                      labelWidget: Text(
                        item.currency!,
                        style: TextStyle(fontSize: 18.sp),
                      ));
                }).toList(),
              ),
              border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              hintText: 'Zadaj sumu...',
              hintStyle: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontSize: 18.sp,
                color: Theme.of(context).colorScheme.shadow,
              ),
            )));
  }
}
