import 'package:flutter/material.dart';

import '../../model/SourceDiscover.dart';
import 'Details_browse.dart';

class Browse_Ui extends StatelessWidget {
  Results results;

  Browse_Ui({required this.results});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(Details_Browse.routeName, arguments: results);
      },
      child: Container(
        margin: EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(
              child: Card(
                  clipBehavior: Clip.hardEdge,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Image.network(
                    'https://image.tmdb.org/t/p/w500/${results.posterPath}',
                    fit: BoxFit.fill,
                    height: 170,
                  )),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    '${results.title}',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontSize: 11),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '${results.releaseDate}',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontSize: 11),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
