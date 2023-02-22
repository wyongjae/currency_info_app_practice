import 'package:currency_info_app_prac/data/exchange_rate_api.dart';
import 'package:currency_info_app_prac/domain/model/currency_view_model.dart';
import 'package:currency_info_app_prac/presentation/currency_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => CurrencyViewModel(ExchangeRateApi())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const CurrencyScreen(),
      ),
    );
  }
}
