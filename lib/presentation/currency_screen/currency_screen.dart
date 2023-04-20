import 'package:currency_info_app_prac/di/di_setup.dart';
import 'package:currency_info_app_prac/presentation/currency_screen/conversion_rate.dart';
import 'package:currency_info_app_prac/presentation/currency_screen/currency_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
        );
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller1.dispose();
    _controller2.dispose();
    _searchController.dispose();
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
        actions: [
          IconButton(
            onPressed: () {
              context.push('/test');
            },
            icon: const Icon(Icons.settings),
          )
        ],
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
                          return CurrencyDialog(
                            onSearchNationSelect:
                                (ConversionRate searchNation) {
                              viewModel.setNation(searchNation);
                            },
                            // onChanged: (String query) {
                            //   viewModel.searchNation(query);
                            // },
                            // searchNations: viewModel.searchNations,
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
                          return CurrencyDialog(
                            onSearchNationSelect:
                                (ConversionRate searchNation) {
                              viewModel.setNation2(searchNation);
                            },
                            // onChanged: (String query) {
                            //   viewModel.searchNation(query);
                            // },
                            // searchNations: viewModel.searchNations,
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
                      Text(viewModel.pairConversion),
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

class CurrencyDialog extends StatelessWidget {
  final void Function(ConversionRate searchNation) onSearchNationSelect;
  // final void Function(String query) onChanged;
  // final List<ConversionRate> searchNations;

  const CurrencyDialog({
    Key? key,
    required this.onSearchNationSelect,
    // required this.onChanged,
    // required this.searchNations,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = getIt<CurrencyViewModel>();

    return AlertDialog(
      title: TextField(
        style: const TextStyle(
          fontSize: 18,
        ),
        decoration: const InputDecoration(
          hintText: '검색어를 입력하세요',
        ),
        onChanged: (text) {
          viewModel.searchNation(text);
        },
      ),
      content: SizedBox(
        width: double.maxFinite,
        height: 400,
        child: ListView.builder(
          itemCount: viewModel.searchNations.length,
          itemBuilder: (BuildContext context, int index) {
            final searchNation = viewModel.searchNations[index];

            return Column(
              children: [
                const Divider(
                  height: 1,
                  thickness: 1,
                ),
                InkWell(
                  splashColor: Colors.black38,
                  onTap: () {
                    onSearchNationSelect(searchNation);

                    Navigator.pop(context);
                  },
                  child: ListTile(
                    title: Text(searchNation.nation),
                    trailing: Text('${searchNation.rate}'),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
