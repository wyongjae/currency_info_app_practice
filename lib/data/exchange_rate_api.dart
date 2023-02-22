import 'dart:convert';

import 'package:currency_info_app_prac/domain/model/currency_data.dart';
import 'package:http/http.dart' as http;

class ExchangeRateApi {
  Future<Currency> fetch() async {
    const baseUrl = 'https://v6.exchangerate-api.com';
    const key = 'd09d2c0ce8a61a4c4ec2c37e';

    final url = Uri.parse('$baseUrl/v6/$key/latest/KRW');
    final response = await http.get(url);
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    Currency currency = Currency.fromJson(jsonResponse);

    return currency;
  }
}
