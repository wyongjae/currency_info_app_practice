import 'package:currency_info_app_prac/domain/model/currency_data.dart';
import 'package:currency_info_app_prac/domain/model/currency_view_model.dart';
import 'package:currency_info_app_prac/presentation/currency_add_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrencyScreen extends StatelessWidget {
  const CurrencyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CurrencyViewModel>();

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
      body: StreamBuilder<Currency>(
        stream: viewModel.currencyStream,
        builder: (context, snapshot) {
          final datas = snapshot.data;

          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print('${snapshot.error}');
            return Text('${snapshot.error}');
          }
          return ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text('${datas!.conversionRates.AED}'),
              );
            },
          );
        },
      ),
    );
  }
}