import 'package:currency_info_app_prac/data/data_source/currency_api.dart';
import 'package:currency_info_app_prac/data/repository/currency_api_repository.dart';
import 'package:currency_info_app_prac/presentation/currency_add_screen/currency_add_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/testing.dart';

void main() {
  test('viewModel test', () async {
    final viewModel =
        CurrencyAddViewModel(CurrencyRateRepository(CurrencyApi()));
  });
}
