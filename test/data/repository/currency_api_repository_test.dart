import 'dart:convert';

import 'package:currency_info_app_prac/data/data_source/currency_api.dart';
import 'package:currency_info_app_prac/data/repository/currency_api_repository_impl.dart';
import 'package:currency_info_app_prac/domain/model/currency.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('data 를 가져온다', () async {
    final repository = MockCurrencyApiRepository(CurrencyApi());

    final result = await repository.getData();

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
