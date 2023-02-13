import 'package:flutter/material.dart';
import 'Popular/popular_api.dart';
import 'Recommended/recommended_api.dart';
import 'Release_Latest/release_api.dart';
class Home_Movie extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          child: Column(
            children: [

              Expanded(flex: 2, child: Poplur_Container()),
              Expanded(flex: 1, child: Release_Latest()),
              Expanded(flex: 2, child: Recommended_api())
            ],
          )),
    );
  }
}
