import 'package:currency_info_app_prac/presentation/currency_add_screen/currency_add_view_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'currency_state.freezed.dart';

part 'currency_state.g.dart';

@freezed
class CurrencyState with _$CurrencyState {
  factory CurrencyState({
    required ConversionRate conversionRate,
    @Default(0) num money,
    @Default(0) num exchangeRate,
  }) = _CurrencyState;

  factory CurrencyState.fromJson(Map<String, dynamic> json) =>
      _$CurrencyStateFromJson(json);
}
