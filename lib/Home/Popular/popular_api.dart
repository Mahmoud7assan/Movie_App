import 'package:flutter/material.dart';
import 'package:movieapp/Home/Popular/popular_movie.dart';
import 'package:movieapp/api/apimanager.dart';
import 'package:movieapp/model/SourcePopular.dart';
import 'package:movieapp/theme.dart';

class Poplur_Container extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourcePopuler>(
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
              title: resultList[index].title ?? '',
              imagePath: resultList[index].posterPath ?? '',
              backImage: resultList[index].backdropPath ?? '',
              date: resultList[index].releaseDate ?? '',
            );
          },
          itemCount: resultList.length,
        );
      },
    );
  }
}
