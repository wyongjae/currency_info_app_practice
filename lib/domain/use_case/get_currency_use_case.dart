import 'package:currency_info_app_prac/domain/model/currency.dart';
import 'package:currency_info_app_prac/domain/repository/currency_repository.dart';
import 'package:currency_info_app_prac/util/result.dart';

class GetCurrencyUseCase {
  final CurrencyRepository repository;

  GetCurrencyUseCase(this.repository);

  Future<Result<Currency>> call() async {
    final result = await repository.getData();

    return result.when(
      success: (currency) {
        return Result.success(currency);
      },
      error: (message) {
        return Result.error(message);
      },
    );
  }
}
