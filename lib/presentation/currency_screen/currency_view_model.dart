import 'dart:async';

import 'package:currency_info_app_prac/data/repository/currency_api_repository_impl.dart';
import 'package:currency_info_app_prac/domain/model/currency.dart';
import 'package:flutter/material.dart';

class CurrencyViewModel with ChangeNotifier {
  final CurrencyApiRepositoryImpl repository;

  CurrencyViewModel(this.repository);

  Future<Currency> getData() async {
    final result = await repository.getData();
    return result;
  }
}
