import 'dart:convert';

import 'package:currency_info_app_prac/data/data_source/currency_api.dart';
import 'package:currency_info_app_prac/data/repository/currency_api_repository_impl.dart';
import 'package:currency_info_app_prac/domain/model/currency.dart';
import 'package:currency_info_app_prac/presentation/currency_screen/currency_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('올바른 데이터를 가져와야 한다', () async {
    final viewModel =
        CurrencyViewModel(MockCurrencyApiRepository(CurrencyApi()));

    final result = await viewModel.getData();

    expect(result.timeLastUpdateUtc, 'Sun, 26 Feb 2023 00:00:02 +0000');
  });
}

class MockCurrencyApiRepository extends CurrencyApiRepositoryImpl {
  MockCurrencyApiRepository(super.api);

  @override
  Future<Currency> getData() async {
    return Currency.fromJson(jsonDecode(jsonData));
  }
}
