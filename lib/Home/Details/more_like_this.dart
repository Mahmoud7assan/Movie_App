import 'package:flutter/material.dart';

import '../../api/apimanager.dart';
import '../../fire_base/watch_list.dart';
import '../../model/SourceSimilar.dart';
import '../../theme.dart';
import 'more_like_screen.dart';


class MoreLikeThis extends StatelessWidget {
  num movieId;

  MoreLikeThis({required this.movieId});

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    return FutureBuilder<SourceSimilar>(
      future: APIManager.getSimilar(movieId),
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
        return Container(
          //margin: EdgeInsets.only(left: 15),
          padding: EdgeInsets.all(5),
          color: MyTheme.gray,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'More Like This',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontSize: 17),
              ),
              SizedBox(height: 4),
              Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return More_Like_Screen(results: resultList[index],
                          imagePath: resultList[index].posterPath ?? '',
                          favouriteMovie: onMovieFavourite(resultList[index]),);

                      },itemCount: resultList.length,

                      ))

            ],
          ),
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
