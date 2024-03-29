import 'dart:async';
import 'dart:math';

import 'package:currency_info_app_prac/domain/use_case/get_currency_use_case.dart';
import 'package:currency_info_app_prac/presentation/currency_screen/conversion_rate.dart';
import 'package:currency_info_app_prac/presentation/currency_screen/currency_state.dart';
import 'package:currency_info_app_prac/presentation/currency_screen/currency_ui_event.dart';
import 'package:flutter/material.dart';

class CurrencyViewModel with ChangeNotifier {
  final GetCurrencyUseCase getCurrencyUseCase;

  List<ConversionRate> searchNations = [];

  CurrencyState _state = CurrencyState(
    firstButtonConversionRate: ConversionRate(),
    secondButtonConversionRate: ConversionRate(),
  );

  CurrencyState get state => _state;

  String get timeLastUpdateUtc => _state.currency?.timeLastUpdateUtc ?? '';

  String get timeNextUpdateUtc => _state.currency?.timeNextUpdateUtc ?? '';

  String get pairConversion {
    num pairConversionRate = (state.secondButtonConversionRate.rate /
        state.firstButtonConversionRate.rate);

    return pairConversionRate
        .toString()
        .substring(0, min(7, pairConversionRate.toString().length));
  }

  final _eventStreamController = StreamController<CurrencyUiEvent>();

  Stream<CurrencyUiEvent> get eventStream => _eventStreamController.stream;

  CurrencyViewModel(this.getCurrencyUseCase) {
    fetch();
  }

  Future<void> fetch() async {
    final result = await getCurrencyUseCase.execute();

    result.when(
      success: (currency) {
        _state = state.copyWith(
          currency: currency,
          conversionRates: currency.conversionRates.entries
              .map((e) => ConversionRate(
                    nation: e.key,
                    rate: e.value,
                  ))
              .toList(),
        );
      },
      error: (message) {},
    );
    searchNations = state.conversionRates;

    notifyListeners();
  }

  void setNation(ConversionRate conversionRate) {
    _state = state.copyWith(
      firstButtonConversionRate: conversionRate,
      secondFieldMoney: state.firstFieldMoney *
          (state.secondButtonConversionRate.rate / conversionRate.rate),
    );
    searchNations = state.conversionRates;
    notifyListeners();

    _eventStreamController
        .add(CurrencyUiEvent.changeSecondMoney(state.secondFieldMoney));
  }

  void setNation2(ConversionRate conversionRate) {
    _state = state.copyWith(
      secondButtonConversionRate: conversionRate,
      secondFieldMoney: state.firstFieldMoney *
          (conversionRate.rate / state.firstButtonConversionRate.rate),
    );
    searchNations = state.conversionRates;
    notifyListeners();

    _eventStreamController
        .add(CurrencyUiEvent.changeSecondMoney(state.secondFieldMoney));
  }

  void changeFirstTextField(String text) {
    try {
      num money = num.parse(text);
      _state = state.copyWith(
        firstFieldMoney: money,
        secondFieldMoney: money *
            (state.secondButtonConversionRate.rate /
                state.firstButtonConversionRate.rate),
      );
      notifyListeners();
      _eventStreamController
          .add(CurrencyUiEvent.changeSecondMoney(state.secondFieldMoney));
    } catch (e) {
      return;
    }
  }

  void changeSecondTextField(String text) {
    try {
      num money = num.parse(text);
      _state = state.copyWith(
        firstFieldMoney: money *
            (state.firstButtonConversionRate.rate /
                state.secondButtonConversionRate.rate),
        secondFieldMoney: money,
      );
      notifyListeners();
      _eventStreamController
          .add(CurrencyUiEvent.changeFirstMoney(state.firstFieldMoney));
    } catch (e) {
      return;
    }
  }

  void searchNation(String text) {
    if (text.isEmpty) {
      searchNations = state.conversionRates;
    } else {
      searchNations = state.conversionRates
          .where((e) => e.nation.contains(text.toUpperCase()))
          .toList();
    }
    notifyListeners();
  }
}
