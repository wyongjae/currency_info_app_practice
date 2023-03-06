import 'package:currency_info_app_prac/data/data_source/currency_api.dart';
import 'package:currency_info_app_prac/domain/model/currency.dart';
import 'package:currency_info_app_prac/domain/repository/currency_api_repository.dart';

class CurrencyApiRepositoryImpl implements CurrencyApiRepository {
  CurrencyApi api;

  CurrencyApiRepositoryImpl(this.api);

  @override
  Future<Currency> getData() async {
    return await api.fetch();
  }
}
