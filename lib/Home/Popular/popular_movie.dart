


import 'package:flutter/material.dart';
import 'package:movieapp/Home/WatchList/watch_list_screen.dart';

import 'package:movieapp/model/SourcePopular.dart';

import '../../fire_base/database_utils.dart';
import '../../fire_base/watch_list.dart';
import '../Details/movie_details_screen.dart';


class Popular_Movie extends StatefulWidget {

  Results results;
  String imagePath;
  bool favourite;
  MovieData favouriteMovie;

  Popular_Movie({required this.results,required this.imagePath,this.favourite = false, required this.favouriteMovie});

  @override
  State<Popular_Movie> createState() => _Popular_MovieState();
}

class _Popular_MovieState extends State<Popular_Movie> {


  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery
        .of(context)
        .size;
    return InkWell(
      onTap: () {

        Navigator.of(context)
            .pushNamed(MovieDetailsScreen.routeName, arguments: widget.results);
      },
      child: Container(
          margin: EdgeInsets.all(10),
          child: Stack(
            children: [
              Image.network(
                'https://image.tmdb.org/t/p/w500/${widget.results.backdropPath}',
                height: mediaquery.height * 0.26,
              ),
              Positioned(
                  top: 80,
                  left: 13,
                  child: Stack(
                    children: [
                      Image.network(
                        'https://image.tmdb.org/t/p/w500/${widget.results.posterPath}',
                        height: mediaquery.height * 0.23,
                      ),
                      InkWell(
                          onTap: () {
                          widget.favourite = true;
                          addFavouriteMovieToDatabase(widget.favouriteMovie);
                          setState(() { }); },

                          child: Image.asset('assets/images/bookmark.png'))
                    ],
                  )),
              Positioned(
                top: mediaquery.height * 0.26,
                left: mediaquery.width * 0.38,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.results.title ?? '',
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodyLarge,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Released Date: ${widget.results.releaseDate}',
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Colors.white54),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }


  }




