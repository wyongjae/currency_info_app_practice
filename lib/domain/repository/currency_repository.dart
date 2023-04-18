import 'package:currency_info_app_prac/domain/model/currency.dart';

abstract class CurrencyRepository {
  Future<Currency> getData();
}
