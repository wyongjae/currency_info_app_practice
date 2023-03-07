import 'package:currency_info_app_prac/domain/model/currency.dart';
import 'package:currency_info_app_prac/util/result.dart';

abstract class CurrencyRepository {
  Future<Result<Currency>> getData();
}