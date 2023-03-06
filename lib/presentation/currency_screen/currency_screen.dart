import 'package:currency_info_app_prac/presentation/currency_add_screen/currency_add_screen.dart';
import 'package:currency_info_app_prac/presentation/currency_add_screen/currency_add_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrencyScreen extends StatefulWidget {
  const CurrencyScreen({Key? key}) : super(key: key);

  @override
  State<CurrencyScreen> createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
  final TextEditingController _controller = TextEditingController();
  String exchangeResult = '';

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final addViewModel = context.watch<CurrencyAddViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency Screen'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CurrencyAddScreen()),
              );
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
                        money * (addViewModel.conversionRates[1].rate);
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
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              child: Column(
                children: [
                  DropdownButton<ConversionRate>(
                    value: addViewModel.selectedValue.conversionRates.first,
                    items: addViewModel.conversionRates.map((value) {
                      return DropdownMenuItem<ConversionRate>(
                        value: value,
                        child: Text(value.nation),
                      );
                    }).toList(),
                    onChanged: (ConversionRate? value) {
                      setState(() {});
                    },
                  ),
                  Flexible(
                    child: Text(
                      exchangeResult,
                      style: const TextStyle(
                        fontSize: 25,
                      ),
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
