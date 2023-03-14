import 'package:currency_info_app_prac/domain/model/conversion_rates.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'currency_dto.freezed.dart';
part 'currency_dto.g.dart';

@freezed
class CurrencyDto with _$CurrencyDto {
  factory CurrencyDto({
    required String time_last_update_utc,
    required String time_next_update_utc,
    required ConversionRates conversion_rates,
  }) = _CurrencyDto;

  factory CurrencyDto.fromJson(Map<String, dynamic> json) => _$CurrencyDtoFromJson(json);
}