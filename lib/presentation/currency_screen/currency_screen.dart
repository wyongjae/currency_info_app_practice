import 'package:currency_info_app_prac/presentation/currency_add_screen/currency_add_screen.dart';
import 'package:currency_info_app_prac/presentation/currency_screen/currency_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrencyScreen extends StatefulWidget {
  const CurrencyScreen({Key? key}) : super(key: key);

  @override
  State<CurrencyScreen> createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final viewModel = context.read<CurrencyViewModel>();
      viewModel.fetch();

      viewModel.eventStream.listen((event) {
        event.when(showSnackBar: (message) {
          final snackBar = SnackBar(content: Text(message));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        });
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CurrencyViewModel>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: const Text('환율 계산기'),
        elevation: 1,
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
                          Text(viewModel.timeLastUpdateUtc),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          const Text('Last Update :'),
                          const SizedBox(width: 5),
                          Text(viewModel.timeNextUpdateUtc),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            height: 1,
            thickness: 1,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 180,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 150,
                height: 60,
                decoration: BoxDecoration(
                    border: Border.all(
                  width: 2,
                  color: Colors.black45,
                )),
                child: ElevatedButton(
                  onPressed: () {
                    viewModel.fetch();
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        viewModel.fetch();
                        return AlertDialog(
                          title: const Text('검색창'),
                          content: SizedBox(
                            width: double.maxFinite,
                            height: 400,
                            child: ListView.builder(
                              itemCount: viewModel.state.conversionRates.length,
                              itemBuilder: (BuildContext context, int index) {
                                final conversionRate =
                                    viewModel.state.conversionRates[index];

                                return Card(
                                  child: InkWell(
                                    splashColor: Colors.black38,
                                    onTap: () {
                                      viewModel.setNation(conversionRate);
                                      Navigator.pop(context);
                                    },
                                    child: ListTile(
                                      title: Text(conversionRate.nation),
                                      trailing: Text('${conversionRate.rate}'),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    foregroundColor: Colors.black87,
                    backgroundColor: Colors.white,
                    elevation: 0.0,
                  ),
                  child: Text(
                    viewModel.state.conversionRate.nation,
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Text(
                  '${viewModel.state.exchangeRate}',
                  style: const TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
