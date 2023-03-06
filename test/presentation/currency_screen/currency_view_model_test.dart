import 'dart:convert';

import 'package:currency_info_app_prac/data/data_source/currency_api.dart';
import 'package:currency_info_app_prac/domain/model/currency.dart';
import 'package:currency_info_app_prac/domain/repository/currency_repository.dart';
import 'package:currency_info_app_prac/presentation/currency_screen/currency_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('올바른 데이터를 가져와야 한다', () async {
    final viewModel = CurrencyViewModel(MockCurrencyRepository());

    final result = await viewModel.getData();

    expect(result.timeLastUpdateUtc, 'Sat, 25 Feb 2023 00:00:02 +0000');
  });
}

class MockCurrencyRepository extends CurrencyRepository {
  @override
  Future<Currency> getData() async {
    return Currency.fromJson(jsonDecode(jsonData));
  }
}
