import 'package:flutter/material.dart';
import 'package:movieapp/Home/Search/search_screen.dart';

import 'package:provider/provider.dart';

import 'package:movieapp/api/apimanager.dart';
import 'package:movieapp/model/SourceSearch.dart';
import 'package:movieapp/provider.dart';
import 'package:movieapp/theme.dart';

class Search_api extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfig>(context);
    return FutureBuilder<SourceSearch>(
      future: APIManager.getSearch(searchKey: provider.querys),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: CircularProgressIndicator(
            color: MyTheme.orange,
          ));
        } else if (snapshot.hasError) {
          return Column(
            children: [],
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

        var resList = snapshot.data?.results ?? [];
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
                      return Search_screen(
                        results: resList[index],
                      );
                    },
                    itemCount: resList.length,
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
