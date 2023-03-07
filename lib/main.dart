import 'package:currency_info_app_prac/data/data_source/currency_api.dart';
import 'package:currency_info_app_prac/data/repository/currency_repository_impl.dart';
import 'package:currency_info_app_prac/domain/use_case/get_currency_use_case.dart';
import 'package:currency_info_app_prac/presentation/currency_add_screen/currency_add_view_model.dart';
import 'package:currency_info_app_prac/presentation/currency_screen/currency_screen.dart';
import 'package:currency_info_app_prac/presentation/currency_screen/currency_view_model.dart';
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
          create: (_) => CurrencyViewModel(
            GetCurrencyUseCase(CurrencyRepositoryImpl(CurrencyApi())),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => CurrencyAddViewModel(
            GetCurrencyUseCase(CurrencyRepositoryImpl(CurrencyApi())),
          ),
        ),
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
