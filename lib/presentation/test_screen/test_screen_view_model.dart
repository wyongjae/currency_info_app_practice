import 'package:flutter/material.dart';

class TestScreenViewModel extends ChangeNotifier {
  String _text = '안녕하세요';

  String get text => _text;

  void setText(String text) {
    _text = text;
    notifyListeners();
  }
}
