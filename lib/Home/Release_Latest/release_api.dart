import 'package:flutter/material.dart';
import 'package:movieapp/Home/Release_Latest/releases_container.dart';

import 'package:movieapp/api/apimanager.dart';
import 'package:movieapp/fire_base/watch_list.dart';


import 'package:movieapp/model/SourceUpcoming.dart';
import 'package:movieapp/theme.dart';

class Release_Latest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceUpcoming>(
      future: APIManager.getLatest(),
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
            margin: EdgeInsets.only(left: 13, bottom: 5),
            padding: EdgeInsets.all(10),
            color: MyTheme.gray,
            width: double.infinity,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'New Releases',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontSize: 17),
              ),
              SizedBox(height: 8),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Releases_Container(results: resultList[index],
                      imagePath: resultList[index].posterPath ?? '',
                      favouriteMovie: onMovieFavourite(resultList[index]));

                  },
                  itemCount: resultList.length,
                ),
              )
            ]));
      },
    );
  }
  MovieData onMovieFavourite(Results_latest addedMovie){
    Map<String, dynamic>  tmpmap ={
      "title" : addedMovie.title,
      "releaseDate": addedMovie.releaseDate,
      "posterPath": "${addedMovie.posterPath}",
    };
    MovieData movieData = MovieData.fromJson(tmpmap);
    return movieData;
  }
}
