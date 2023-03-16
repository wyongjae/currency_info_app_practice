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

  // 여기서는 money 를 따로 안 받아도 되는 건가 ?
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
      exchangeRate2: _money * conversionRate.rate,
    );
    notifyListeners();
  }

  void changeFirstTextField(String text) {
    try {
      num money = num.parse(text);
      _money = money;
      _state = state.copyWith(
        exchangeRate: _money * state.conversionRate2.rate,
      );
      notifyListeners();
    } catch (e) {
      return;
    }
  }

  void changeSecondTextField(String text) {
    try {
      num money = num.parse(text);
      _money = money;
      _state = state.copyWith(
        exchangeRate2: _money * state.conversionRate.rate,
      );
      notifyListeners();
    } catch (e) {
      return;
    }
  }

  void searchNation(String text) {
    if (text.isEmpty) {
      _state = state.copyWith(conversionRates: conversionRates);
    }
    _state = state.copyWith(
        conversionRates: conversionRates
            .where((e) =>
                e.nation.toUpperCase().contains(text) ||
                e.nation.toLowerCase().contains(text))
            .toList());
  }
}
