import 'package:currency_info_app_prac/domain/use_case/get_currency_use_case.dart';
import 'package:currency_info_app_prac/presentation/currency_add_screen/currency_add_state.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'currency_add_view_model.freezed.dart';

part 'currency_add_view_model.g.dart';

@freezed
class ConversionRate with _$ConversionRate {
  factory ConversionRate({
    @Default('KRW') String nation,
    @Default(1) num rate,
  }) = _ConversionRate;

  factory ConversionRate.fromJson(Map<String, dynamic> json) =>
      _$ConversionRateFromJson(json);
}

class CurrencyAddViewModel with ChangeNotifier {
  final GetCurrencyUseCase getCurrencyUseCase;

  List<ConversionRate> get conversionRates =>
      state.currency?.conversionRates.entries
          .map((e) => ConversionRate(
                nation: e.key,
                rate: e.value,
              ))
          .toList() ??
      [];

  var _state = CurrencyAddState();

  CurrencyAddState get state => _state;

  String get timeLastUpdateUtc => _state.currency?.timeLastUpdateUtc ?? '';

  String get timeNextUpdateUtc => _state.currency?.timeNextUpdateUtc ?? '';

  final List<ConversionRate> _addedData = [];

  CurrencyAddViewModel(this.getCurrencyUseCase);

  Future<void> fetch() async {
    final result = await getCurrencyUseCase();

    result.when(
      success: (currency) {
        _state = state.copyWith(
          currency: currency,
          conversionRates: conversionRates,
        );
      },
      error: (message) {},
    );

    notifyListeners();
  }

  // 선택한 data 를 리스트에 추가
  void addData(ConversionRate conversionRate) {
    _addedData.add(conversionRate);
    _state = state.copyWith(
      addedData: _addedData,
    );
    notifyListeners();
  }

  // 선택한 data 를 리스트에서 제거
  void removeData(ConversionRate conversionRate) {
    _addedData.remove(conversionRate);

    _state = state.copyWith(
      addedData: _addedData,
    );
    notifyListeners();
  }

  void selectedData(ConversionRate conversionRate) {
    _state = state.copyWith(
      isSelected: !state.isSelected,
    );

    if (_state.isSelected) {
      addData(conversionRate);
    } else {
      removeData(conversionRate);
    }
  }
}
