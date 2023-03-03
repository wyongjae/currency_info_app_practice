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
  @override
  Widget build(BuildContext context) {
    final addViewModel = context.watch<CurrencyAddViewModel>();
    var firstValue = addViewModel.conversionRates.first;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency Screen'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CurrencyAddScreen(),
                ),
              );
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 250,
              height: 120,
              color: Colors.cyan,
            ),
            const SizedBox(height: 20),
            Container(
              width: 250,
              height: 120,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Colors.black,
                ),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 15),
                    width: 250,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 0.1,
                        color: Colors.black,
                      ),
                    ),
                    child: DropdownButton<ConversionRate>(
                      value: firstValue,
                      items: addViewModel.conversionRates
                          .map<DropdownMenuItem<ConversionRate>>((value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value.nation),
                        );
                      }).toList(),
                      onChanged: (ConversionRate? value) {
                        setState(() {
                          firstValue = value!;
                        });
                      },
                    ),
                  ),
                  const Text('Data 표시'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
