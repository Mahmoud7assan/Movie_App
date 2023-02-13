import 'package:flutter/material.dart';


import '../../theme.dart';

class Buttons extends StatelessWidget {
  String title;

  Buttons({required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        child: Text(
          '$title',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 13),
        ),
        style: ElevatedButton.styleFrom(
            side: BorderSide(color: MyTheme.gray),
            backgroundColor: Colors.transparent));
  }
}
