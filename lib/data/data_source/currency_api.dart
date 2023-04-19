import 'package:http/http.dart' as http;

class CurrencyApi {
  final http.Client _client;

  CurrencyApi({http.Client? client}) : _client = (client ?? http.Client());

  Future<http.Response> fetch() async {
    const baseUrl = 'v6.exchangerate-api.com';
    const myKey = 'd76de5b5220a9d6ee0184223';

    final url = Uri.parse('https://$baseUrl/v6/$myKey/latest/KRW');
    final response = await _client.get(url);

    return response;
  }
}
