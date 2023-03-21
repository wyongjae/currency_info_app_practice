import 'dart:async';

import 'package:currency_info_app_prac/domain/use_case/get_currency_use_case.dart';
import 'package:currency_info_app_prac/presentation/currency_add_screen/currency_add_view_model.dart';
import 'package:currency_info_app_prac/presentation/currency_screen/currency_state.dart';
import 'package:currency_info_app_prac/presentation/currency_screen/currency_ui_event.dart';
import 'package:flutter/material.dart';

class CurrencyViewModel with ChangeNotifier {
  final GetCurrencyUseCase getCurrencyUseCase;

  List<ConversionRate> get conversionRates =>
      state.currency!.conversionRates.entries
          .map((e) => ConversionRate(
                nation: e.key,
                rate: e.value,
              ))
          .toList();

  List<ConversionRate> searchNations = [];

  CurrencyState _state = CurrencyState(
    firstButtonConversionRate: ConversionRate(),
    secondButtonConversionRate: ConversionRate(),
  );

  CurrencyState get state => _state;

  String get timeLastUpdateUtc => _state.currency?.timeLastUpdateUtc ?? '';

  String get timeNextUpdateUtc => _state.currency?.timeNextUpdateUtc ?? '';

  num get pairConversion => (state.secondButtonConversionRate.rate /
      state.firstButtonConversionRate.rate);

  final _eventStreamController = StreamController<CurrencyUiEvent>();

  Stream<CurrencyUiEvent> get eventStream => _eventStreamController.stream;

  CurrencyViewModel(this.getCurrencyUseCase) {
    fetch();
  }

  Future<void> fetch() async {
    final result = await getCurrencyUseCase();

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

    notifyListeners();
  }

  void setNation(ConversionRate conversionRate) {
    _state = state.copyWith(
      firstButtonConversionRate: conversionRate,
      secondFieldMoney: state.firstFieldMoney *
          (state.secondButtonConversionRate.rate / conversionRate.rate),
    );
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
    List<ConversionRate> result = [];

    if (text.isEmpty) {
      result = conversionRates;
      searchNations = result;
      notifyListeners();
    } else if (text.isNotEmpty) {
      result = conversionRates
          .where((e) =>
              e.nation.contains(text.toUpperCase()) ||
              e.nation.contains(text.toLowerCase()))
          .toList();
      notifyListeners();
    }
    _eventStreamController.add(CurrencyUiEvent.searchNation(result));
    searchNations = result;
    notifyListeners();
  }
}
