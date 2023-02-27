import 'package:currency_info_app_prac/presentation/currency_add_screen/currency_add_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrencyAddScreen extends StatefulWidget {
  const CurrencyAddScreen({Key? key}) : super(key: key);

  @override
  State<CurrencyAddScreen> createState() => _CurrencyAddScreenState();
}

class _CurrencyAddScreenState extends State<CurrencyAddScreen> {
  @override
  Widget build(BuildContext context) {
    final addViewModel = context.watch<CurrencyAddViewModel>();
    List<ExchangeRate> conversionRates = addViewModel.exchangeRate();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency Add Screen'),
        actions: [
          FloatingActionButton(
            elevation: 0.0,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Add',
              style: TextStyle(fontSize: 18),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              height: 45,
              width: 500,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FutureBuilder(
                      future: addViewModel.fetch(),
                      builder: (BuildContext context, snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }

                        final data = snapshot.data!;

                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                const Text('Next Update :'),
                                const SizedBox(width: 5),
                                Text(data.timeNextUpdateUtc),
                              ],
                            ),
                            Row(
                              children: [
                                const Text('Last Update :'),
                                const SizedBox(width: 5),
                                Text(data.timeLastUpdateUtc),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Divider(
            height: 2,
            color: Colors.grey,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: conversionRates.length,
              itemBuilder: (BuildContext context, int index) {
                final conversionRate = conversionRates[index];

                return GestureDetector(
                  onTap: () {
                    addViewModel.selectedData(conversionRate);
                  },
                  child: Card(
                    child: ListTile(
                      title: Text(conversionRate.nation),
                      trailing: Column(
                        children: [
                          Text('${conversionRate.rate}'),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
