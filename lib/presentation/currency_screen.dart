import 'package:currency_info_app_prac/presentation/currency_add_screen.dart';
import 'package:flutter/material.dart';

class CurrencyScreen extends StatelessWidget {
  const CurrencyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: ListView(
        children: const [
          ListTile(
            title: Text('data'),
          ),
        ],
      ),
    );
  }
}