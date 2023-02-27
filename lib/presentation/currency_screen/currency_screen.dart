import 'package:currency_info_app_prac/presentation/currency_add_screen/currency_add_screen.dart';
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
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {},
            child: const ListTile(
              title: Text('데이터 표시'),
              trailing: Text('데이터 표시'),
            ),
          );
        },
      ),
    );
  }
}
