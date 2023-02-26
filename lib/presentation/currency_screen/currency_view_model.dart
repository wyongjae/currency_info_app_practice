import 'dart:async';

import 'package:currency_info_app_prac/data/repository/currency_api_repository.dart';
import 'package:flutter/material.dart';

class CurrencyViewModel with ChangeNotifier {
  CurrencyRateRepository repository;

  CurrencyViewModel(this.repository);

  Future<void> getData() async {
    await repository.getData();
    notifyListeners();
  }

  Future<int> lastUpdate() async {
    final time = await repository.getData();
    return time.timeLastUpdateUnix;
  }

  Future<int> nextUpdate() async {
    final time = await repository.getData();
    return time.timeNextUpdateUnix;
  }
}
