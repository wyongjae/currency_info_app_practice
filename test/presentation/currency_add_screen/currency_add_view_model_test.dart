import 'dart:convert';

import 'package:currency_info_app_prac/data/data_source/currency_api.dart';
import 'package:currency_info_app_prac/domain/model/currency.dart';
import 'package:currency_info_app_prac/domain/repository/currency_repository.dart';
import 'package:currency_info_app_prac/presentation/currency_add_screen/currency_add_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('viewModel test', () async {
    final viewModel = CurrencyAddViewModel(MockCurrencyRepository());

    await viewModel.fetch();

    expect(viewModel.timeLastUpdateUtc, 'Sat, 25 Feb 2023 00:00:02 +0000');
  });
}

class MockCurrencyRepository extends CurrencyRepository {
  @override
  Future<Currency> getData() async {
    return Currency.fromJson(jsonDecode(jsonData));
  }
}
