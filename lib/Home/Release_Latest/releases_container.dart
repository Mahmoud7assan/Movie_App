import 'package:flutter/material.dart';

import '../../fire_base/database_utils.dart';
import '../../fire_base/watch_list.dart';
import '../../model/SourceUpcoming.dart';
import '../../theme.dart';
import 'Details_releases.dart';

class Releases_Container extends StatefulWidget {
  Results_latest results;
  String imagePath;
  bool favourite;
  MovieData favouriteMovie;

  Releases_Container({required this.results,required this.imagePath,this.favourite = false, required this.favouriteMovie});

  @override
  State<Releases_Container> createState() => _Releases_ContainerState();
}

class _Releases_ContainerState extends State<Releases_Container> {
  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    return Stack(
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context)
                .pushNamed(Details_Releases.routeName, arguments: widget.results);
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(9),
            child: Container(
              margin: EdgeInsets.all(8),
              child: Image.network(
                'https://image.tmdb.org/t/p/w500/${widget.results.posterPath}',
                height: mediaquery.height * 0.3,
              ),
            ),
          ),
        ),
        InkWell(onTap: (){
          widget.favourite = true;
          addFavouriteMovieToDatabase(widget.favouriteMovie);
          setState(() { });
        },
          child: InkWell(
            onTap: (){
              widget.favourite = true;
              addFavouriteMovieToDatabase(widget.favouriteMovie);
              setState(() { });
            },
            child: Image.asset(
              'assets/images/bookmark.png',
              height: 27,
            ),
          ),
        )
      ],
    );
  }
}
