import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class AppConfig extends ChangeNotifier {
  String querys = '';
  bool isSearch = true;
  int select = 0;
  void isSearchEnable() {
    isSearch = !isSearch;
    notifyListeners();
  }
  void KeyWordSearch(String newValue) {
    querys = newValue;
    notifyListeners();
  }
}