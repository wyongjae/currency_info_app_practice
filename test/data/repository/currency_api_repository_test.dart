import 'package:currency_info_app_prac/data/data_source/currency_api.dart';
import 'package:currency_info_app_prac/data/repository/currency_repository_impl.dart';
import 'package:currency_info_app_prac/domain/model/currency.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('data 를 가져온다', () async {
    final repository = CurrencyRepositoryImpl(MockCurrencyApi());

    final result = await repository.getData();

    expect(result.timeLastUpdateUtc, 'Sat, 25 Feb 2023 00:00:02 +0000');
  });
}

class MockCurrencyApi extends CurrencyApi {
  @override
  Future<Currency> fetch() async {
    return Currency(timeLastUpdateUtc: 'Sat, 25 Feb 2023 00:00:02 +0000');
  }
}
