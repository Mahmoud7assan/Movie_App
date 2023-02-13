import 'package:flutter/material.dart';

import 'package:movieapp/Home/Details/buttons_geners.dart';
import 'package:movieapp/Home/Details/more_like_this.dart';
import 'package:movieapp/Home/home_screen.dart';
import 'package:movieapp/api/apimanager.dart';

import 'package:movieapp/model/SourceUpcoming.dart';
import 'package:movieapp/model/Source_details.dart';
import 'package:movieapp/theme.dart';

import '../../fire_base/database_utils.dart';
import '../../fire_base/watch_list.dart';
import '../../model/SourceDiscover.dart';

class Details_Releases extends StatefulWidget {
  static String routeName = 'Details_releases';

  @override
  State<Details_Releases> createState() => _Details_ReleasesState();
}

class _Details_ReleasesState extends State<Details_Releases> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Results_latest;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(
          args.title ?? '',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(Home_Screen.routeName);
          },
        ),
        backgroundColor: Colors.white12,
        elevation: 0,
        centerTitle: true,
      ),
      body: FutureBuilder<SourceDetails>(
        future: APIManager.getDetails(args.id ?? 0),
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
                ElevatedButton(onPressed: () {}, child: Text('Try again'))
              ],
            );
          }
          if (snapshot.data?.Success == false) {
// server has code and message
            return Column(
              children: [
                Text(snapshot.data?.StatusMessage ?? ''),
                ElevatedButton(onPressed: () {}, child: Text('Try again'))
              ],
            );
          }
          var details = snapshot.data!;
          var geners = snapshot.data!.genres ?? [];
          return Container(
            margin: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                    'https://image.tmdb.org/t/p/w500/${details.backdropPath}'),
                Text(
                  details.title ?? '',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                Text(
                  details.releaseDate ?? '',
                  style: TextStyle(color: Colors.white24, fontSize: 10),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Image.network(
                          'https://image.tmdb.org/t/p/w500/${details.posterPath}',
                          width: 100,
                          height: 150,
                        ),
                        Image.asset('assets/images/bookmark.png'),
                      ],
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      //flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Buttons(title: '${geners[0].name}'),
                            ],
                          ),
                          Text(
                            '${details.overview}',
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                          SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              Text(
                                '${details.voteAverage?.toStringAsFixed(1)}',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(
                    flex: 1,
                    child: MoreLikeThis(
                      movieId: details.id ?? 0,
                    ))
              ],
            ),
          );
        },
      ),
    );
  }
}
