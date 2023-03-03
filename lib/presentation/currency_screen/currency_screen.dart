import 'package:currency_info_app_prac/presentation/currency_add_screen/currency_add_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrencyScreen extends StatefulWidget {
  const CurrencyScreen({Key? key}) : super(key: key);

  @override
  State<CurrencyScreen> createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
  String exchangeResult = '';
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final addViewModel = context.watch<CurrencyAddViewModel>();
    String _selectedValue = 'KRW';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency Screen'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 250,
              child: TextFormField(
                controller: _controller,
                keyboardType: TextInputType.number,
                onChanged: (text) {
                  try {
                    double money = double.parse(_controller.text);

                    double exchangeMoney =
                        money * (addViewModel.conversionRates[0].rate);
                    exchangeResult = exchangeMoney.toString();
                  } catch (e) {
                    'Error : $e';
                  }
                  setState(() {
                    exchangeResult;
                  });
                },
                decoration: const InputDecoration(
                    labelText: 'KRW',
                    hintText: '금액을 입력하세요.',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 250,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              child: Column(
                children: [
                  DropdownButton<String>(
                    value: _selectedValue,
                    items: addViewModel.conversionRates
                        .map<DropdownMenuItem<String>>((value) {
                      return DropdownMenuItem(
                        value: value.nation,
                        child: Text(value.nation),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        _selectedValue = value!;
                      });
                    },
                  ),
                  Text(
                    exchangeResult,
                    style: const TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
