import 'package:flutter/material.dart';
import 'package:movieapp/Home/WatchList/watch_list_screen.dart';
import 'package:provider/provider.dart';

import 'package:movieapp/provider.dart';
import 'package:movieapp/theme.dart';
import 'package:movieapp/Home/Browse/browse_category.dart';
import 'Search/Search_api.dart';
import 'home_movie.dart';

class Home_Screen extends StatefulWidget {
  static const String routeName = 'Home_Screen';

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  var currentIndex = 0;
  bool selected = true;

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    var provider = Provider.of<AppConfig>(context);

    return Scaffold(
        appBar: currentIndex == 1
            ? AppBar(
          leading: null,
                backgroundColor: Colors.transparent,
                elevation: 0,
                foregroundColor: Colors.transparent,
                title: TextFormField(
                  onChanged: (text) {
                    provider.KeyWordSearch(text);
                  },
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: TextStyle(color: Colors.white, fontSize: 15),
                      filled: true,
                      fillColor: MyTheme.gray,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(color: Colors.transparent,
                          ))),
                ))
            : null,
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: MyTheme.colorBar,
          fixedColor: MyTheme.yellow,
          currentIndex: currentIndex,
          onTap: (index) {
            currentIndex = index;
            setState(() {});
          },
          unselectedItemColor: MyTheme.iconcolorBar,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/browse.png')),
              label: 'Browse',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/watchlist.png')),
              label: 'WatchList',
            )
          ],
        ),
        backgroundColor: Colors.transparent,
        body: tabs[currentIndex]);
  }

  List<Widget> tabs = [Home_Movie(), Search_api(),Browse_Category(),WatchListScreen()];
}
