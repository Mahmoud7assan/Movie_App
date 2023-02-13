import 'package:flutter/material.dart';
import 'Home/WatchList/watch_list_screen.dart';
import 'package:movieapp/provider.dart';
import 'package:movieapp/theme.dart';
import 'package:provider/provider.dart';
import 'package:movieapp/Home/Browse/Details_browse.dart';
import 'package:movieapp/Home/Browse/browse_screen.dart';
import 'package:movieapp/Home/Details/Details_more_like.dart';
import 'package:movieapp/Home/Details/movie_details_screen.dart';
import 'package:movieapp/Home/Recommended/Details_recomended.dart';
import 'package:movieapp/Home/Release_Latest/Details_releases.dart';
import 'package:movieapp/Home/Search/Details_Search.dart';
import 'package:movieapp/Home/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
      ChangeNotifierProvider(create: (context) => AppConfig(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Home_Screen.routeName,
      theme: MyTheme.DarkMode,
      routes: {
        Home_Screen.routeName: (context) => Home_Screen(),
        MovieDetailsScreen.routeName: (context) => MovieDetailsScreen(),
        Details_Search.routeName: (context) => Details_Search(),
        Details_Releases.routeName: (context) => Details_Releases(),
        Details_recomended.routeName: (context) => Details_recomended(),
        Details_More_Like.routeName: (context) => Details_More_Like(),
        Browse_Screen.routeName: (context) => Browse_Screen(),
        Details_Browse.routeName: (context) => Details_Browse(),
        WatchListScreen.routeName: (context) => WatchListScreen(),
      },
    );
  }
}
