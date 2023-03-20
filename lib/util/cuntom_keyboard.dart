import 'package:flutter/material.dart';

class CustomKeyboard extends StatefulWidget {
  const CustomKeyboard({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomKeyboard> createState() => _CustomKeyboardState();
}

class _CustomKeyboardState extends State<CustomKeyboard> {
  final keys = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '.', '0', '<-'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(

        itemCount: keys.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1.8,
          crossAxisCount: 3,
        ),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              // 키를 눌렀을 때의 동작을 정의합니다.
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                color: Colors.white24,
              ),
              child: Center(
                child: Text(
                  keys[index].toString(),
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
