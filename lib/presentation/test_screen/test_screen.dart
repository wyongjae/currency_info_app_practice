import 'package:currency_info_app_prac/presentation/test_screen/test_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<TestScreenViewModel>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: const Text('Test Screen'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            viewModel.setText('Hello World');
          },
          child: Text(viewModel.text),
        ),
      ),
    );
  }
}
