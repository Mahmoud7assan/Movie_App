import 'package:flutter/material.dart';

import '../../api/apimanager.dart';
import '../../fire_base/database_utils.dart';
import '../../fire_base/watch_list.dart';
import '../../model/SourceRecommended.dart';
import '../../model/Source_details.dart';
import '../../theme.dart';
import '../Details/buttons_geners.dart';
import '../Details/more_like_this.dart';
import '../home_screen.dart';

class Details_recomended extends StatefulWidget {
  static String routeName = 'Details_Recomnded';

  @override
  State<Details_recomended> createState() => _Details_recomendedState();
}

class _Details_recomendedState extends State<Details_recomended> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Results;
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
//data
          var details = snapshot.data!;
          var geners = snapshot.data!.genres ?? [];
          return Column(
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
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
          );
        },
      ),
    );
  }
}
