import 'package:currency_info_app_prac/domain/model/currency.dart';

abstract class CurrencyApiRepository {
  Future<Currency> getData();
}