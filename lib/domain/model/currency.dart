import 'package:currency_info_app_prac/domain/model/conversion_rate.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'currency.freezed.dart';
part 'currency.g.dart';

@freezed
class Currency with _$Currency {
  factory Currency({
    @Default('') String timeLastUpdateUtc,
    @Default('') String timeNextUpdateUtc,
    ConversionRates? conversionRates,
  }) = _Currency;

  factory Currency.fromJson(Map<String, dynamic> json) => _$CurrencyFromJson(json);
}