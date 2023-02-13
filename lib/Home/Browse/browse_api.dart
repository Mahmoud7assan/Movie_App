import 'package:flutter/material.dart';


import '../../model/SourceGeners.dart';
import 'browse_screen.dart';

class Browse_Api extends StatelessWidget {
  Genres genres;

  Browse_Api({required this.genres});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(Browse_Screen.routeName, arguments: genres);
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset('assets/images/image_movie.png'),
          Text('${genres.name}',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}
