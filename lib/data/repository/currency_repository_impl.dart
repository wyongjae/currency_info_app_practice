import 'package:currency_info_app_prac/data/data_source/currency_api.dart';
import 'package:currency_info_app_prac/domain/model/currency.dart';
import 'package:currency_info_app_prac/domain/repository/currency_repository.dart';

class CurrencyRepositoryImpl implements CurrencyRepository {
  CurrencyApi api;

  CurrencyRepositoryImpl(this.api);

  @override
  Future<Currency> getData() async {
    return await api.fetch();
  }
}
