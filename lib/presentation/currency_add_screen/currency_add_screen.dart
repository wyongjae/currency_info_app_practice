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
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final addViewModel = context.read<CurrencyAddViewModel>();
      addViewModel.fetch();
    });
  }

  @override
  Widget build(BuildContext context) {
    final addViewModel = context.watch<CurrencyAddViewModel>();

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
              height: 42,
              width: 500,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text('Next Update :'),
                          const SizedBox(width: 5),
                          Text(addViewModel.timeLastUpdateUtc),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          const Text('Last Update :'),
                          const SizedBox(width: 5),
                          Text(addViewModel.timeNextUpdateUtc),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            height: 2,
            color: Colors.grey,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: addViewModel.state.conversionRates.length,
              itemBuilder: (BuildContext context, int index) {
                final conversionRate =
                    addViewModel.state.conversionRates[index];

                return GestureDetector(
                  onTap: () {
                    addViewModel.selectedData(conversionRate);
                  },
                  child: Card(
                    child: ListTile(
                      title: Text(conversionRate.nation),
                      trailing: Text('${conversionRate.rate}'),
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
