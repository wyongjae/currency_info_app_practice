import 'dart:async';

import 'package:currency_info_app_prac/data/data_source/currency_api.dart';
import 'package:currency_info_app_prac/data/model/currency_data.dart';
import 'package:flutter/material.dart';

class CurrencyViewModel with ChangeNotifier {
  final CurrencyApi api;

  CurrencyViewModel(this.api);

  final _currencyStreamController = StreamController<Currency>.broadcast();

  Stream<Currency> get currencyStream => _currencyStreamController.stream;

  Future<void> fetchData() async {
    final result = await api.fetch();
    _currencyStreamController.add(result);
    notifyListeners();
  }
}
