import 'package:currency_info_app_prac/domain/model/currency.dart';
import 'package:currency_info_app_prac/domain/repository/currency_repository.dart';
import 'package:currency_info_app_prac/util/result.dart';

class GetCurrencyUseCase {
  final CurrencyRepository repository;

  GetCurrencyUseCase(this.repository);

  Future<Result<Currency>> execute() async {
    final currency = await repository.getData();
    try {
      return Result.success(currency);
    } catch (e) {
      return const Result.error('네트워크 에러');
    }
  }
}
