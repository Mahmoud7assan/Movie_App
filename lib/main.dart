import 'package:flutter/material.dart';
import 'package:movieapp/Home/home_screen.dart';
import 'package:movieapp/provider.dart';
import 'package:movieapp/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: Home_Screen.routeName,
      theme: MyTheme.DarkMode,
      routes: {Home_Screen.routeName: (context) => Home_Screen()},
    );
  }
}
