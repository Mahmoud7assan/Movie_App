import 'package:flutter/material.dart';

import '../../api/apimanager.dart';
import '../../model/SourceDiscover.dart';
import '../../model/SourceGeners.dart';
import '../../theme.dart';
import 'browse_ui.dart';

class Browse_Screen extends StatelessWidget {
  static String routeName = 'Browse_Screen';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Genres;
    return FutureBuilder<SourceDiscover>(
      future: APIManager.getDiscover(args.id.toString()),
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

        var results = snapshot.data?.results ?? [];
        return SafeArea(
          child: Container(
            margin: EdgeInsets.all(8),
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        color: Colors.grey,
                        width: 1,
                        height: 1,
                      );
                    },
                    itemBuilder: (context, index) {
                      return Browse_Ui(
                        results: results[index],
                      );
                    },
                    itemCount: results.length,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
