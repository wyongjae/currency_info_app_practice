import 'package:freezed_annotation/freezed_annotation.dart';

part 'currency_ui_event.freezed.dart';

@freezed
abstract class CurrencyUiEvent<T> with _$CurrencyUiEvent<T> {
  const factory CurrencyUiEvent.showSnackBar(String message) = ShowSnackBar;

  const factory CurrencyUiEvent.changeFirstMoney(num money) = ChangeFirstMoney;

  const factory CurrencyUiEvent.changeSecondMoney(num money) =
      ChangeSecondMoney;
}
