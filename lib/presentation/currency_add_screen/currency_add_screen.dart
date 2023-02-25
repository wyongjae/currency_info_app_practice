import 'package:currency_info_app_prac/presentation/currency_add_screen/currency_add_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrencyAddScreen extends StatelessWidget {
  const CurrencyAddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CurrencyAddViewModel>();
    List<ExchangeRate> conversionRates = viewModel.exchangeRate();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency Add Screen'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: const [
                        Text('마지막 업데이트 시간'),
                        Text('마지막 업데이트 시간'),
                      ],
                    ),
                    const SizedBox(),
                    IconButton(
                      onPressed: () async {
                        await viewModel.fetch();
                      },
                      icon: const Icon(Icons.refresh),
                    )
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

                return ListTile(
                  title: Text(conversionRate.nation),
                  trailing: Text('${conversionRate.rate}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
