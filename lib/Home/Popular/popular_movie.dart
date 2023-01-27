import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
class Popular_Movie extends StatelessWidget {
  String title;
  String backImage;
  String imagePath;
  String date;

  Popular_Movie(
      {required this.title,
      required this.imagePath,
      required this.backImage,
      required this.date});

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    return Container(
        margin: EdgeInsets.all(10),
        child: Stack(
          children: [
            Image.network(
              'https://image.tmdb.org/t/p/w500/$backImage',
              height: mediaquery.height * 0.26,
            ),
            Positioned(
                top: 80,
                left: 13,
                child: Stack(
                  children: [
                    Image.network(
                      'https://image.tmdb.org/t/p/w500/$imagePath',
                      height: mediaquery.height * 0.23,
                    ),
                    Image.asset('assets/images/bookmark.png')
                  ],
                )),
            Positioned(
              top: mediaquery.height * 0.26,
              left: mediaquery.width * 0.38,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Released Date: $date',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.white54),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
