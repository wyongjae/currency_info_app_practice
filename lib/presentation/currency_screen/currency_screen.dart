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
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

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
    _controller1.dispose();
    _controller2.dispose();
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
            height: 210,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 150,
                height: 55,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.black45,
                  ),
                ),
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

                                return Column(
                                  children: [
                                    const Divider(
                                      height: 1,
                                      thickness: 1,
                                    ),
                                    InkWell(
                                      splashColor: Colors.black38,
                                      onTap: () {
                                        viewModel.setNation(conversionRate);
                                        Navigator.pop(context);
                                      },
                                      child: ListTile(
                                        title: Text(conversionRate.nation),
                                        trailing:
                                            Text('${conversionRate.rate}'),
                                      ),
                                    ),
                                  ],
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
              Container(
                width: 200,
                height: 55,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.black45,
                  ),
                ),
                child: TextFormField(
                  style: const TextStyle(fontSize: 20),
                  controller: _controller1,
                  keyboardType: TextInputType.number,
                  onChanged: (text) {
                    // 반대로 했을 때는 작동이 안 되는데 무슨 차이 ??
                    _controller2.text = text;
                    viewModel.changeFirstTextField(text);
                  },
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    border: InputBorder.none,
                    hintText: '금액을 입력하세요',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 150,
                height: 55,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.black45,
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    // 데이터를 바로 표시하기 위해 fetch 를 2번 실행
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

                                return Column(
                                  children: [
                                    const Divider(
                                      height: 1,
                                      thickness: 1,
                                    ),
                                    InkWell(
                                      splashColor: Colors.black38,
                                      onTap: () {
                                        viewModel.setNation2(
                                          conversionRate,
                                          _controller2.text,
                                        );
                                        Navigator.pop(context);
                                      },
                                      child: ListTile(
                                        title: Text(conversionRate.nation),
                                        trailing:
                                            Text('${conversionRate.rate}'),
                                      ),
                                    ),
                                  ],
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
                    viewModel.state.conversionRate2.nation,
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              Container(
                width: 200,
                height: 55,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.black45,
                  ),
                ),
                child: TextFormField(
                  style: const TextStyle(fontSize: 20),
                  controller: _controller2,
                  keyboardType: TextInputType.number,
                  onChanged: (text) {
                    _controller1.text = text;
                    viewModel.changeSecondTextField(text);
                  },
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    border: InputBorder.none,
                    hintText: '금액을 입력하세요',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Flexible(
            child: Text(
              '${viewModel.state.exchangeRate}',
              style: const TextStyle(
                fontSize: 25,
              ),
            ),
          ),
          Flexible(
            child: Text(
              '${viewModel.state.conversionRate}',
              style: const TextStyle(
                fontSize: 25,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Flexible(
            child: Text(
              '${viewModel.state.exchangeRate2}',
              style: const TextStyle(
                fontSize: 25,
              ),
            ),
          ),
          Flexible(
            child: Text(
              '${viewModel.state.conversionRate2}',
              style: const TextStyle(
                fontSize: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
