import 'dart:collection';

import 'package:currency_info_app_prac/data/model/currency_data.dart';
import 'package:currency_info_app_prac/data/repository/currency_api_repository.dart';
import 'package:flutter/material.dart';

class ExchangeRate {
  String nation;
  num rate;
  num currency;

  ExchangeRate(this.nation, this.rate, this.currency);
}

class CurrencyAddState {
  Currency? currency;
  final bool isLoading;

  CurrencyAddState(this.currency, this.isLoading);

  CurrencyAddState copyWith({Currency? currency, bool? isLoading}) {
    return CurrencyAddState(
      currency ??= this.currency,
      isLoading ??= this.isLoading,
    );
  }
}

class CurrencyAddViewModel with ChangeNotifier {
  CurrencyRateRepository repository;
  final conversionRateData = {
    "KRW": 1,
    "AED": 0.002806,
    "AFN": 0.06870,
    "ALL": 0.08377,
    "AMD": 0.2991,
    "ANG": 0.001368,
    "AOA": 0.3950,
    "ARS": 0.1505,
    "AUD": 0.001130,
    "AWG": 0.001368,
    "AZN": 0.001305,
    "BAM": 0.001411,
    "BBD": 0.001528,
    "BDT": 0.08184,
    "BGN": 0.001411,
    "BHD": 0.00028726,
    "BIF": 1.6014,
    "BMD": 0.00076399,
    "BND": 0.001029,
    "BOB": 0.005342,
    "BRL": 0.003939,
    "BSD": 0.00076399,
    "BTN": 0.06312,
    "BWP": 0.01021,
    "BYN": 0.001929,
    "BZD": 0.001528,
    "CAD": 0.001042,
    "CDF": 1.6122,
    "CHF": 0.00071542,
    "CLP": 0.6177,
    "CNY": 0.005318,
    "COP": 3.7629,
    "CRC": 0.4313,
    "CUP": 0.01834,
    "CVE": 0.07956,
    "CZK": 0.01714,
    "DJF": 0.1358,
    "DKK": 0.005383,
    "DOP": 0.04309,
    "DZD": 0.1058,
    "EGP": 0.02353,
    "ERN": 0.01146,
    "ETB": 0.04156,
    "EUR": 0.00072153,
    "FJD": 0.001700,
    "FKP": 0.00063682,
    "FOK": 0.005383,
    "GBP": 0.00063764,
    "GEL": 0.002020,
    "GGP": 0.00063682,
    "GHS": 0.009972,
    "GIP": 0.00063682,
    "GMD": 0.04893,
    "GNF": 6.5833,
    "GTQ": 0.006029,
    "GYD": 0.1631,
    "HKD": 0.006029,
    "HNL": 0.01903,
    "HRK": 0.005436,
    "HTG": 0.1154,
    "HUF": 0.2749,
    "IDR": 11.6236,
    "ILS": 0.002797,
    "IMP": 0.00063682,
    "INR": 0.06316,
    "IQD": 1.1286,
    "IRR": 32.5944,
    "ISK": 0.1102,
    "JEP": 0.00063682,
    "JMD": 0.1191,
    "JOD": 0.00054167,
    "JPY": 0.1036,
    "KES": 0.09740,
    "KGS": 0.06712,
    "KHR": 3.1184,
    "KID": 0.001130,
    "KMF": 0.3550,
    "KWD": 0.00023522,
    "KYD": 0.00063666,
    "KZT": 0.3448,
    "LAK": 13.1005,
    "LBP": 11.4598,
    "LKR": 0.2794,
    "LRD": 0.1216,
    "LSL": 0.01406,
    "LYD": 0.003724,
    "MAD": 0.008028,
    "MDL": 0.01446,
    "MGA": 3.3380,
    "MKD": 0.04432,
    "MMK": 1.9841,
    "MNT": 2.7241,
    "MOP": 0.006180,
    "MRU": 0.02811,
    "MUR": 0.03495,
    "MVR": 0.01193,
    "MWK": 0.7926,
    "MXN": 0.01403,
    "MYR": 0.003407,
    "MZN": 0.04933,
    "NAD": 0.01406,
    "NGN": 0.3554,
    "NIO": 0.02821,
    "NOK": 0.007914,
    "NPR": 0.1010,
    "NZD": 0.001233,
    "OMR": 0.00029375,
    "PAB": 0.00076399,
    "PEN": 0.002904,
    "PGK": 0.002744,
    "PHP": 0.04197,
    "PKR": 0.2012,
    "PLN": 0.003415,
    "PYG": 5.6391,
    "QAR": 0.002781,
    "RON": 0.003551,
    "RSD": 0.08502,
    "RUB": 0.05785,
    "RWF": 0.8404,
    "SAR": 0.002865,
    "SBD": 0.006341,
    "SCR": 0.01013,
    "SDG": 0.3455,
    "SEK": 0.007979,
    "SGD": 0.001033,
    "SHP": 0.00063682,
    "SLE": 0.01532,
    "SLL": 15.3359,
    "SOS": 0.4397,
    "SRD": 0.02578,
    "SSP": 0.6019,
    "STN": 0.01768,
    "SYP": 1.9397,
    "SZL": 0.01406,
    "THB": 0.02667,
    "TJS": 0.007864,
    "TMT": 0.002683,
    "TND": 0.002414,
    "TOP": 0.001809,
    "TRY": 0.01444,
    "TTD": 0.005221,
    "TVD": 0.001130,
    "TWD": 0.02328,
    "TZS": 1.7955,
    "UAH": 0.02829,
    "UGX": 2.8554,
    "USD": 0.00076342,
    "UYU": 0.03035,
    "UZS": 8.7055,
    "VES": 0.01864,
    "VND": 18.2859,
    "VUV": 0.09140,
    "WST": 0.002086,
    "XAF": 0.4733,
    "XCD": 0.002063,
    "XDR": 0.00057634,
    "XOF": 0.4733,
    "XPF": 0.08610,
    "YER": 0.1932,
    "ZAR": 0.01406,
    "ZMW": 0.01518,
    "ZWL": 0.6729
  };

  bool _isSelected = false;

  bool get isSelected => _isSelected;

  // exchangeRate 메써드의 conversion_rates data 리스트로 표시
  List<ExchangeRate> _data = [];
  final List<ExchangeRate> _selectedData = [];

  List<ExchangeRate> get selectedDate => _selectedData;

  List<ExchangeRate> get conversionRate => UnmodifiableListView(_data);

  final CurrencyAddState _state = CurrencyAddState(null, false);

  CurrencyAddState get state => _state;

  String get timeLastUpdateUtc => _state.currency?.timeLastUpdateUtc ?? '';

  String get timeNextUpdateUtc => _state.currency?.timeNextUpdateUtc ?? '';

  CurrencyAddViewModel(this.repository);

  Future<void> fetch() async {
    _state.currency = await repository.getData();
    exchangeRate();
    notifyListeners();
  }

  // conversionRateData 의 Map 형태를 List 형태로 변환
  void exchangeRate() {
    _data = conversionRateData.entries
        .map((e) => ExchangeRate(e.key, e.value, e.value * 1000))
        .toList();
    notifyListeners();
  }

  // 선택한 data 를 리스트에 추가
  void addData(ExchangeRate conversionRate) {
    _selectedData.add(conversionRate);
    notifyListeners();
  }

  // 선택한 data 를 리스트에서 제거
  void removeData(ExchangeRate conversionRate) {
    _selectedData.remove(conversionRate);
    notifyListeners();
  }

  void selectedData(ExchangeRate exchangeRateData) {
    _isSelected = !_isSelected;

    if (_isSelected) {
      addData(exchangeRateData);
    } else {
      removeData(exchangeRateData);
    }
  }
}
