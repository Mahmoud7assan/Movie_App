import 'package:flutter/material.dart';

import '../../api/apimanager.dart';
import '../../model/SourceGeners.dart';
import '../../theme.dart';
import 'browse_api.dart';

class Browse_Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceGeners>(
      future: APIManager.getGeners(),
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
        var resultList = snapshot.data?.genres ?? [];
        return SafeArea(
            child: Container(
          margin: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Browse Category',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Expanded(
                child: GridView.builder(
                    itemCount: resultList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 18,
                        crossAxisSpacing: 18),
                    itemBuilder: (context, index) {
                      return Browse_Api(genres: resultList[index]);
                    }),
              )
            ],
          ),
        ));
      },
    );
  }
}
