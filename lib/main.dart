import 'dart:io';

import 'package:currency_calculator/currency_rates/presentation/bloc/calculate_currency_bloc.dart';
import 'package:currency_calculator/currency_rates/presentation/bloc/currency_rates_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:window_manager/window_manager.dart';

import 'config/themes/app_themes.dart';
import 'currency_rates/presentation/pages/HomePage.dart';
import 'injectables/injector_container.dart';
import 'dart:developer' as developer;

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> main() async {
  setup();
  if (kIsWeb) {
    HttpOverrides.global = MyHttpOverrides();
  }else if (Platform.isWindows) {
    HttpOverrides.global = MyHttpOverrides();
    WidgetsFlutterBinding.ensureInitialized();
    await windowManager.ensureInitialized();
    WindowManager.instance.setMinimumSize(const Size(200, 300));
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MaterialApp(
        title: 'Currency calculator',
        theme: theme(),
        home: MultiBlocProvider(
          providers: [
            BlocProvider<CurrencyRatesBloc>(
                create: (context) => locator()..add(const GetCurrencyRates())),
            BlocProvider<CalculateCurrencyBloc>(create: (context) => locator())
          ],
          child: HomePage(),
        ),
      );
    });
  }
}
