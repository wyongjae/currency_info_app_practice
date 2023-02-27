import 'dart:convert';

import 'package:currency_info_app_prac/data/model/currency_data.dart';
import 'package:http/http.dart' as http;

class CurrencyApi {
  Future<Currency> fetch() async {
    const baseUrl = 'https://v6.exchangerate-api.com';
    const myKey = 'd09d2c0ce8a61a4c4ec2c37e';

    final url = Uri.parse('$baseUrl/v6/$myKey/latest/KRW');
    final response = await http.get(url);

    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    Currency currency = Currency.fromJson(jsonResponse);

    return currency;
  }
}
