import 'dart:math';

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
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _searchController = TextEditingController();
  String _searchText = '';
  List<ConversionRate> searchNations = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final viewModel = context.read<CurrencyViewModel>();

      viewModel.eventStream.listen((event) {
        event.when(
          showSnackBar: (message) {},
          changeFirstMoney: (money) {
            _controller1.text = money.toString();
          },
          changeSecondMoney: (money) {
            _controller2.text = money.toString();
          },
          searchNation: (List<ConversionRate> conversionRate) {
            searchNations = viewModel.searchResult;
          },
        );
      });
      searchNations = viewModel.conversionRates;

      _searchController.addListener(() {
        _searchText = _searchController.text;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    final viewModel = context.read<CurrencyViewModel>();

    _controller1.dispose();
    _controller2.dispose();
    _searchController.dispose();
    _searchController.removeListener(() {
      return viewModel.searchNation(_searchController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CurrencyViewModel>();
    final state = viewModel.state;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: const Text('환율 계산기'),
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Column(
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
              height: 200,
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
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: TextField(
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                              controller: _searchController,
                              decoration: const InputDecoration(
                                hintText: '검색어를 입력하세요',
                              ),
                              onChanged: (text) {
                                viewModel.searchNation(_searchText);
                              },
                            ),
                            content: SizedBox(
                              width: double.maxFinite,
                              height: 400,
                              child: ListView.builder(
                                itemCount: searchNations.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final searchNation = searchNations[index];

                                  return Column(
                                    children: [
                                      const Divider(
                                        height: 1,
                                        thickness: 1,
                                      ),
                                      InkWell(
                                        splashColor: Colors.black38,
                                        onTap: () {
                                          viewModel.setNation(searchNation);
                                          Navigator.pop(context);
                                        },
                                        child: ListTile(
                                          title: Text(searchNation.nation),
                                          trailing:
                                              Text('${searchNation.rate}'),
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
                      state.firstButtonConversionRate.nation,
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
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('검색창'),
                            content: SizedBox(
                              width: double.maxFinite,
                              height: 400,
                              child: ListView.builder(
                                itemCount: state.conversionRates.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final conversionRate =
                                      state.conversionRates[index];

                                  return Column(
                                    children: [
                                      const Divider(
                                        height: 1,
                                        thickness: 1,
                                      ),
                                      InkWell(
                                        splashColor: Colors.black38,
                                        onTap: () {
                                          viewModel.setNation2(conversionRate);
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
                      state.secondButtonConversionRate.nation,
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
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 28.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text('2023년 3월 17일 기준 환율'),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('1 ${state.firstButtonConversionRate.nation} = '),
                      Text('${viewModel.pairConversion}'.substring(0,
                          min(7, viewModel.pairConversion.toString().length))),
                      Text(' ${state.secondButtonConversionRate.nation}'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
