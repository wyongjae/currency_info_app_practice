import 'package:currency_info_app_prac/domain/model/currency.dart';
import 'package:currency_info_app_prac/presentation/currency_add_screen/currency_add_view_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'currency_add_state.freezed.dart';

part 'currency_add_state.g.dart';

@freezed
class CurrencyAddState with _$CurrencyAddState {
  factory CurrencyAddState({
    Currency? currency,
    @Default(false) bool isSelected,
    @Default([]) List<ConversionRate> conversionRates,
    @Default([]) List<ConversionRate> addedData,
  }) = _CurrencyAddState;

  factory CurrencyAddState.fromJson(Map<String, dynamic> json) =>
      _$CurrencyAddStateFromJson(json);
}
