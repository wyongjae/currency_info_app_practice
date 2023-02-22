class Currency {
  Currency({
    required this.result,
    required this.documentation,
    required this.termsOfUse,
    required this.timeLastUpdateUnix,
    required this.timeLastUpdateUtc,
    required this.timeNextUpdateUnix,
    required this.timeNextUpdateUtc,
    required this.baseCode,
    required this.conversionRates,
  });
  late final String result;
  late final String documentation;
  late final String termsOfUse;
  late final int timeLastUpdateUnix;
  late final String timeLastUpdateUtc;
  late final int timeNextUpdateUnix;
  late final String timeNextUpdateUtc;
  late final String baseCode;
  late final ConversionRates conversionRates;

  Currency.fromJson(Map<String, dynamic> json){
    result = json['result'];
    documentation = json['documentation'];
    termsOfUse = json['terms_of_use'];
    timeLastUpdateUnix = json['time_last_update_unix'];
    timeLastUpdateUtc = json['time_last_update_utc'];
    timeNextUpdateUnix = json['time_next_update_unix'];
    timeNextUpdateUtc = json['time_next_update_utc'];
    baseCode = json['base_code'];
    conversionRates = ConversionRates.fromJson(json['conversion_rates']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['result'] = result;
    _data['documentation'] = documentation;
    _data['terms_of_use'] = termsOfUse;
    _data['time_last_update_unix'] = timeLastUpdateUnix;
    _data['time_last_update_utc'] = timeLastUpdateUtc;
    _data['time_next_update_unix'] = timeNextUpdateUnix;
    _data['time_next_update_utc'] = timeNextUpdateUtc;
    _data['base_code'] = baseCode;
    _data['conversion_rates'] = conversionRates.toJson();
    return _data;
  }
}

class ConversionRates {
  ConversionRates({
    required this.USD,
    required this.AUD,
    required this.BGN,
    required this.CAD,
    required this.CHF,
    required this.CNY,
    required this.EGP,
    required this.EUR,
    required this.GBP,
  });
  late final int USD;
  late final double AUD;
  late final double BGN;
  late final double CAD;
  late final double CHF;
  late final double CNY;
  late final double EGP;
  late final double EUR;
  late final double GBP;

  ConversionRates.fromJson(Map<String, dynamic> json){
    USD = json['USD'];
    AUD = json['AUD'];
    BGN = json['BGN'];
    CAD = json['CAD'];
    CHF = json['CHF'];
    CNY = json['CNY'];
    EGP = json['EGP'];
    EUR = json['EUR'];
    GBP = json['GBP'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['USD'] = USD;
    _data['AUD'] = AUD;
    _data['BGN'] = BGN;
    _data['CAD'] = CAD;
    _data['CHF'] = CHF;
    _data['CNY'] = CNY;
    _data['EGP'] = EGP;
    _data['EUR'] = EUR;
    _data['GBP'] = GBP;
    return _data;
  }
}