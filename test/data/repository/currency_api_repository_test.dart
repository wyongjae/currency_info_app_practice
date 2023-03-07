import 'package:currency_info_app_prac/data/data_source/currency_api.dart';
import 'package:currency_info_app_prac/data/repository/currency_repository_impl.dart';
import 'package:currency_info_app_prac/domain/model/currency.dart';
import 'package:currency_info_app_prac/util/result.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('data 를 가져온다', () async {
    final repository = CurrencyRepositoryImpl(MockCurrencyApi());

    final Result<Currency> result = await repository.getData();

    expect((result as Success<Currency>).data.timeLastUpdateUtc,
        'Sat, 25 Feb 2023 00:00:02 +0000');
  });
}

class MockCurrencyApi extends CurrencyApi {
  @override
  Future<Result<Currency>> fetch() async {
    return Result.success(
        Currency(timeLastUpdateUtc: 'Sat, 25 Feb 2023 00:00:02 +0000'));
  }
}
