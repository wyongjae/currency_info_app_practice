import 'package:currency_info_app_prac/data/data_source/currency_api.dart';
import 'package:currency_info_app_prac/data/repository/currency_repository_impl.dart';
import 'package:currency_info_app_prac/domain/model/currency.dart';
import 'package:currency_info_app_prac/util/result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

void main() {
  test('data 를 가져온다', () async {
    final repository = CurrencyRepositoryImpl(CurrencyApi(client: mockClient));

    final Currency result = await repository.getData();

    expect((result as Success<Currency>).data.timeLastUpdateUtc,
        'Sat, 25 Feb 2023 00:00:02 +0000');
  });
}

const baseUrl = 'v6.exchangerate-api.com';
const myKey = 'd76de5b5220a9d6ee0184223';

final url = Uri.parse('https://$baseUrl/v6/$myKey/latest/KRW');

final mockClient = MockClient((request) async {
  if (request.url == url) {
    return Response(fakeJson, 200);
  }

  return Response('error', 404);
});

const fakeJson = '''{
 "result":"success",
 "documentation":"https://www.exchangerate-api.com/docs",
 "terms_of_use":"https://www.exchangerate-api.com/terms",
 "time_last_update_unix":1679011202,
 "time_last_update_utc":"Fri, 17 Mar 2023 00:00:02 +0000",
 "time_next_update_unix":1679097602,
 "time_next_update_utc":"Sat, 18 Mar 2023 00:00:02 +0000",
 "base_code":"KRW",
 "conversion_rates":{
  "KRW":1,
  "AED":0.002810,
  "AFN":0.06712,
  "ALL":0.08276,
  "AMD":0.2958,
  "ANG":0.001370,
  "AOA":0.3900,
  "ARS":0.1548,
  "AUD":0.001150,
  "AWG":0.001370,
  "AZN":0.001299,
  "BAM":0.001409,
  "BBD":0.001530,
  "BDT":0.08141,
  "BGN":0.001409,
  "BHD":0.00028771,
  "BIF":1.5811,
  "BMD":0.00076519,
  "BND":0.001029,
  "BOB":0.005288,
  "BRL":0.004033,
  "BSD":0.00076519,
  "BTN":0.06335,
  "BWP":0.01016,
  "BYN":0.001917,
  "BZD":0.001530,
  "CAD":0.001049,
  "CDF":1.5294,
  "CHF":0.00070921,
  "CLP":0.6270,
  "CNY":0.005269,
  "COP":3.7216,
  "CRC":0.4189,
  "CUP":0.01836,
  "CVE":0.07942,
  "CZK":0.01728,
  "DJF":0.1360,
  "DKK":0.005373,
  "DOP":0.04189,
  "DZD":0.1043,
  "EGP":0.02358,
  "ERN":0.01148,
  "ETB":0.04105,
  "EUR":0.00072024,
  "FJD":0.001708,
  "FKP":0.00063208,
  "FOK":0.005373,
  "GBP":0.00063209,
  "GEL":0.001964,
  "GGP":0.00063208,
  "GHS":0.009499,
  "GIP":0.00063208,
  "GMD":0.04799,
  "GNF":6.5000,
  "GTQ":0.005954,
  "GYD":0.1596,
  "HKD":0.005994,
  "HNL":0.01880,
  "HRK":0.005427,
  "HTG":0.1175,
  "HUF":0.2854,
  "IDR":11.8115,
  "ILS":0.002802,
  "IMP":0.00063208,
  "INR":0.06335,
  "IQD":1.1143,
  "IRR":32.6139,
  "ISK":0.1080,
  "JEP":0.00063208,
  "JMD":0.1164,
  "JOD":0.00054252,
  "JPY":0.1013,
  "KES":0.09920,
  "KGS":0.06663,
  "KHR":3.0789,
  "KID":0.001150,
  "KMF":0.3543,
  "KWD":0.00023388,
  "KYD":0.00063766,
  "KZT":0.3550,
  "LAK":12.9508,
  "LBP":11.4778,
  "LKR":0.2585,
  "LRD":0.1224,
  "LSL":0.01405,
  "LYD":0.003666,
  "MAD":0.007962,
  "MDL":0.01420,
  "MGA":3.3429,
  "MKD":0.04449,
  "MMK":1.8077,
  "MNT":2.6897,
  "MOP":0.006174,
  "MRU":0.02629,
  "MUR":0.03564,
  "MVR":0.01177,
  "MWK":0.7986,
  "MXN":0.01451,
  "MYR":0.003438,
  "MZN":0.04869,
  "NAD":0.01405,
  "NGN":0.3518,
  "NIO":0.02798,
  "NOK":0.008233,
  "NPR":0.1014,
  "NZD":0.001238,
  "OMR":0.00029421,
  "PAB":0.00076519,
  "PEN":0.002904,
  "PGK":0.002690,
  "PHP":0.04194,
  "PKR":0.2151,
  "PLN":0.003382,
  "PYG":5.4704,
  "QAR":0.002785,
  "RON":0.003536,
  "RSD":0.08438,
  "RUB":0.05860,
  "RWF":0.8327,
  "SAR":0.002869,
  "SBD":0.006412,
  "SCR":0.01043,
  "SDG":0.3411,
  "SEK":0.008059,
  "SGD":0.001029,
  "SHP":0.00063208,
  "SLE":0.01637,
  "SLL":16.3737,
  "SOS":0.4341,
  "SRD":0.02681,
  "SSP":0.6094,
  "STN":0.01765,
  "SYP":1.9200,
  "SZL":0.01405,
  "THB":0.02626,
  "TJS":0.008306,
  "TMT":0.002666,
  "TND":0.002398,
  "TOP":0.001805,
  "TRY":0.01449,
  "TTD":0.005184,
  "TVD":0.001150,
  "TWD":0.02337,
  "TZS":1.7727,
  "UAH":0.02810,
  "UGX":2.8537,
  "USD":0.00076520,
  "UYU":0.03002,
  "UZS":8.6894,
  "VES":0.01846,
  "VND":18.0418,
  "VUV":0.09136,
  "WST":0.002082,
  "XAF":0.4724,
  "XCD":0.002066,
  "XDR":0.00056929,
  "XOF":0.4724,
  "XPF":0.08595,
  "YER":0.1912,
  "ZAR":0.01405,
  "ZMW":0.01557,
  "ZWL":0.7003
 }
}''';
