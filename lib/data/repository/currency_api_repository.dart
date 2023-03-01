import 'package:currency_info_app_prac/data/data_source/currency_api.dart';
import 'package:currency_info_app_prac/domain/model/currency.dart';

class CurrencyRateRepository {
  CurrencyApi api;

  CurrencyRateRepository(this.api);

  Future<Currency> getData() async {
    return  api.fetch();
  }
}
