import 'package:currency_info_app_prac/data/data_source/currency_api.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../data/repository/currency_api_repository_test.dart';

void main() {
  test('viewModel test', () async {
    final viewModel =
        MockCurrencyAddViewModel(MockCurrencyApiRepository(CurrencyApi()));

    await viewModel.fetch();
  });
}

class MockCurrencyAddViewModel {
  final MockCurrencyApiRepository repository;

  MockCurrencyAddViewModel(this.repository);

  Future<void> fetch() async {
    await repository.getData();
  }
}
