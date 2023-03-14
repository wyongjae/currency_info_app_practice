import 'package:currency_info_app_prac/presentation/currency_add_screen/currency_add_screen.dart';
import 'package:currency_info_app_prac/presentation/currency_add_screen/currency_add_view_model.dart';
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              height: 40,
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
            color: Colors.black38,
            thickness: 1,
          ),
          const SizedBox(
            height: 180,
          ),
          SizedBox(
            width: 250,
            child: TextFormField(
              controller: _controller,
              keyboardType: TextInputType.number,
              onChanged: (text) {
                // FormatException error 를 처리하기 위해서 작성
                try {
                  num money = num.parse(_controller.text);
                  viewModel.inputMoney(money);
                } catch (e) {
                  return;
                }
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
                  value: viewModel.state.conversionRate,
                  items: viewModel.conversionRates.map((value) {
                    return DropdownMenuItem<ConversionRate>(
                      value: value,
                      child: Text(value.nation),
                    );
                  }).toList(),
                  onChanged: (ConversionRate? value) {
                    viewModel.setNation(value!);
                  },
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
          ),
        ],
      ),
    );
  }
}
