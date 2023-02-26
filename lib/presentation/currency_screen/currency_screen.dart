import 'package:currency_info_app_prac/presentation/currency_add_screen/currency_add_screen.dart';
import 'package:currency_info_app_prac/presentation/currency_add_screen/currency_add_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrencyScreen extends StatelessWidget {
  const CurrencyScreen({Key? key}) : super(key: key);

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
                  builder: (context) => const CurrencyAddScreen(),
                ),
              );
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: addViewModel.rateData.length,
        itemBuilder: (BuildContext context, int index) {
          final conversionData = addViewModel.rateData[index];

          return ListTile(
            title: Text(conversionData.nation),
            trailing: Text('${conversionData.rate}'),
          );
        },
      ),
    );
  }
}
