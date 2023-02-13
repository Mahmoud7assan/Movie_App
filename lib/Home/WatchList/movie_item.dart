
import 'package:flutter/material.dart';
import 'package:movieapp/api/apimanager.dart';


import 'package:movieapp/fire_base/database_utils.dart';
import 'package:movieapp/fire_base/watch_list.dart';

class MovieItem extends StatelessWidget {
  MovieData movieData;
  MovieItem(this.movieData);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [
          Stack(
            children: [
              Image.network(
                 "https://image.tmdb.org/t/p/w500/${movieData.posterPath}",

                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width*0.3,
                height: MediaQuery.of(context).size.height*0.2,
              ),
              InkWell(
                onTap: () async{
                  await deleteMovieFromFirebase(movieData.title);
                },
                child: Image.asset("assets/images/favourite.png"),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${movieData.title}",
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Text("${movieData.releaseDate}", textAlign: TextAlign.start),
              ],
            ),
          )
        ],
      ),
    );
  }
}
