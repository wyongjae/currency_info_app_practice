import 'package:freezed_annotation/freezed_annotation.dart';

part 'conversion_rate.freezed.dart';

part 'conversion_rate.g.dart';

@freezed
class ConversionRate with _$ConversionRate {
  factory ConversionRate({
    @Default('KRW') String nation,
    @Default(1) num rate,
  }) = _ConversionRate;

  factory ConversionRate.fromJson(Map<String, dynamic> json) =>
      _$ConversionRateFromJson(json);
}