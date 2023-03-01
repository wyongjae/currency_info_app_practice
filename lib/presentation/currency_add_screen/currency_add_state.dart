import 'package:currency_info_app_prac/domain/model/currency.dart';
import 'package:currency_info_app_prac/presentation/currency_add_screen/currency_add_view_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'currency_add_state.freezed.dart';

part 'currency_add_state.g.dart';

@freezed
class CurrencyAddState with _$CurrencyAddState {
  factory CurrencyAddState({
    @Default(false) bool isSelected,
    @CurrencyAddStateConverter()
    @Default([])
        List<ConversionRate> conversionRates,
    @Default([]) List<ConversionRate> addedData,
    Currency? currency,
  }) = _CurrencyAddState;

  factory CurrencyAddState.fromJson(Map<String, dynamic> json) =>
      _$CurrencyAddStateFromJson(json);
}

class CurrencyAddStateConverter
    implements JsonConverter<CurrencyAddState, Map<String, dynamic>> {
  const CurrencyAddStateConverter();

  @override
  CurrencyAddState fromJson(Map<String, dynamic> json) {
    return CurrencyAddState.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(CurrencyAddState data) => data.toJson();
}
