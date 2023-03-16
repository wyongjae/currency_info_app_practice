import 'package:currency_info_app_prac/domain/model/currency.dart';
import 'package:currency_info_app_prac/presentation/currency_add_screen/currency_add_view_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'currency_state.freezed.dart';

part 'currency_state.g.dart';

@freezed
class CurrencyState with _$CurrencyState {
  factory CurrencyState({
    required ConversionRate conversionRate,
    required ConversionRate conversionRate2,
    @Default(0) num exchangeRate,
    @Default(0) num exchangeRate2,
    Currency? currency,
    @Default([]) List<ConversionRate> conversionRates,
  }) = _CurrencyState;

  factory CurrencyState.fromJson(Map<String, dynamic> json) =>
      _$CurrencyStateFromJson(json);
}
