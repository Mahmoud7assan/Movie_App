import 'package:flutter/material.dart';

import '../../fire_base/database_utils.dart';
import '../../fire_base/watch_list.dart';
import '../../model/SourceSimilar.dart';
import '../../theme.dart';
import 'Details_more_like.dart';

class More_Like_Screen extends StatefulWidget {
  Results results;
  String imagePath;
  bool favourite;
  MovieData favouriteMovie;

  More_Like_Screen({required this.results,required this.favouriteMovie,required this.imagePath, this.favourite = false});

  @override
  State<More_Like_Screen> createState() => _More_Like_ScreenState();
}

class _More_Like_ScreenState extends State<More_Like_Screen> {
  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(Details_More_Like.routeName, arguments: widget.results);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Container(
          margin: EdgeInsets.all(8),
          color: MyTheme.Fontgray,
          width: mediaquery.width * 0.24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.all(8),
                    child: Image.network(
                        'https://image.tmdb.org/t/p/w500/${widget.results.posterPath}',
                        height: mediaquery.height * 0.16),
                  ),
                  InkWell(
                    onTap: (){
                      widget.favourite = true;
                      addFavouriteMovieToDatabase(widget.favouriteMovie);
                      setState(() { });
                    },
                    child: Image.asset(
                      'assets/images/bookmark.png',
                      height: 27,
                    ),
                  )
                ],
              ),
              SizedBox(height: 2),
              Container(
                padding: EdgeInsets.only(left: 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: MyTheme.yellow,
                          size: 16,
                        ),
                        SizedBox(width: 3),
                        Text(
                          '${widget.results.voteAverage}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(fontSize: 8),
                        )
                      ],
                    ),
                    SizedBox(height: 5),
                    Text(
                      '${widget.results.title}',
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontSize: 13),
                    ),
                    SizedBox(height: 7),
                    Text(
                      '${widget.results.releaseDate}',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontSize: 10, color: Colors.white),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
