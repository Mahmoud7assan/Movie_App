import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class AppConfig extends ChangeNotifier{
  ThemeMode themes = ThemeMode.light;
  void ThemeModee(){
    themes;
    notifyListeners();
}
}