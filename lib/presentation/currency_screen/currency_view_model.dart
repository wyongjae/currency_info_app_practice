import 'dart:async';

import 'package:currency_info_app_prac/domain/use_case/get_currency_use_case.dart';
import 'package:currency_info_app_prac/presentation/currency_add_screen/currency_add_view_model.dart';
import 'package:currency_info_app_prac/presentation/currency_screen/currency_state.dart';
import 'package:currency_info_app_prac/presentation/currency_screen/currency_ui_event.dart';
import 'package:flutter/material.dart';

class CurrencyViewModel with ChangeNotifier {
  final GetCurrencyUseCase getCurrencyUseCase;

  List<ConversionRate> get conversionRates =>
      state.currency?.conversionRates.entries
          .map((e) => ConversionRate(
                nation: e.key,
                rate: e.value,
              ))
          .toList() ??
      [];

  CurrencyState _state = CurrencyState(
    conversionRate: ConversionRate(),
    conversionRate2: ConversionRate(),
  );

  CurrencyState get state => _state;

  String get timeLastUpdateUtc => _state.currency?.timeLastUpdateUtc ?? '';

  String get timeNextUpdateUtc => _state.currency?.timeNextUpdateUtc ?? '';

  final _eventStreamController = StreamController<CurrencyUiEvent>();

  Stream<CurrencyUiEvent> get eventStream => _eventStreamController.stream;

  num _money = 0;

  CurrencyViewModel(this.getCurrencyUseCase);

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

  void setNation(ConversionRate conversionRate) {
    _state = state.copyWith(
      conversionRate: conversionRate,
      exchangeRate: _money * conversionRate.rate,
    );
    notifyListeners();
  }

  void setNation2(ConversionRate conversionRate) {
    _state = state.copyWith(
      conversionRate2: conversionRate,
      exchangeRate: _money * conversionRate.rate,
    );
    notifyListeners();
  }

  void inputMoney(num money) {
    _money = money;
    _state = state.copyWith(
      exchangeRate: _money * state.conversionRate.rate,
    );
    notifyListeners();
  }

  void changeTextField(String text) {
    try {
      num money = num.parse(text);
      inputMoney(money);
    } catch (e) {
      return;
    }
  }
}
