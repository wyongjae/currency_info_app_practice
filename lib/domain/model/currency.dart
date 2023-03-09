import 'package:freezed_annotation/freezed_annotation.dart';

part 'currency.freezed.dart';
part 'currency.g.dart';

typedef ConversionRates = Map<String, dynamic>;

@freezed
class Currency with _$Currency {
  factory Currency({
    @JsonKey(name: 'time_last_update_utc')
    @Default('0')
        String timeLastUpdateUtc,
    @JsonKey(name: 'time_next_update_utc')
    @Default('0')
        String timeNextUpdateUtc,
    @JsonKey(name: 'conversion_rates')
    @Default(<String, dynamic>{})
        ConversionRates conversionRates,
  }) = _Currency;

  factory Currency.fromJson(Map<String, dynamic> json) =>
      _$CurrencyFromJson(json);
}
