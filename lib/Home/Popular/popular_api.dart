import 'package:flutter/material.dart';
import 'package:movieapp/Home/Popular/popular_movie.dart';

import 'package:movieapp/api/apimanager.dart';
import 'package:/movieapp/fire_base/watch_list.dart';
import 'package:movieapp/model/SourcePopular.dart';
import '../../theme.dart';


class Poplur_Container extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourcePopular>(
      future: APIManager.getSources(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: CircularProgressIndicator(
            color: MyTheme.orange,
          ));
        } else if (snapshot.hasError) {
          return Column(
            children: [
              Text('Something went wrong'),
              ElevatedButton(onPressed: () {}, child: Text('Trey again'))
            ],
          );
        }
        if (snapshot.data?.page != 1) {
// server has code and message
          return Column(
            children: [
              Text(snapshot.data?.StatusMessage ?? ''),
              ElevatedButton(onPressed: () {}, child: Text('Try again'))
            ],
          );
        }
//data
        var resultList = snapshot.data?.results ?? [];
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Popular_Movie(
              results: resultList[index],
              imagePath: resultList[index].posterPath ?? '',
              favouriteMovie: onMovieFavourite(resultList[index]),
            );
          },
          itemCount: resultList.length,
        );
      },
    );
  }
  MovieData onMovieFavourite(Results addedMovie){
    Map<String, dynamic>  tmpmap ={
      "title" : addedMovie.title,
      "releaseDate": addedMovie.releaseDate,
      "posterPath": "${addedMovie.posterPath}",
    };
    MovieData movieData = MovieData.fromJson(tmpmap);
    return movieData;
  }
}
