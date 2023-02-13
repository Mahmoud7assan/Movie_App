import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/SourceDiscover.dart';
import '../model/SourceGeners.dart';
import '../model/SourcePopular.dart';
import '../model/SourceRecommended.dart';
import '../model/SourceSearch.dart';
import '../model/SourceSimilar.dart';
import '../model/SourceUpcoming.dart';
import '../model/Source_details.dart';

class APIManager {
  static const String baseUrl = 'api.themoviedb.org';

  static Future<SourcePopular> getSources() async {
    https: //api.themoviedb.org/3/movie/popular?api_key=fb7eef06b1a6f1388c140740a88d5b46&language=en-US&page=1

    var url = Uri.https(baseUrl, '/3/movie/popular', {
      'api_key': 'fb7eef06b1a6f1388c140740a88d5b46',
    });
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString); //string
      var sourcePopular = SourcePopular.fromJson(json); //string to json
      return sourcePopular;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  static Future<SourceUpcoming> getLatest() async {
    https: //api.themoviedb.org/3/movie/upcoming?api_key=fb7eef06b1a6f1388c140740a88d5b46&language=en-US
    var url = Uri.https(baseUrl, '/3/movie/upcoming', {
      'api_key': 'fb7eef06b1a6f1388c140740a88d5b46',
    });
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString); //string
      var sourceUpcoming = SourceUpcoming.fromJson(json); //string to json
      return sourceUpcoming;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  static Future<SourceRecommended> getRecommended() async {
    https: //api.themoviedb.org/3/movie/top_rated?api_key=fb7eef06b1a6f1388c140740a88d5b46&language=en-US&
    var url = Uri.https(baseUrl, '/3/movie/top_rated', {
      'api_key': 'fb7eef06b1a6f1388c140740a88d5b46',
    });
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString); //string
      var sourceRecommended = SourceRecommended.fromJson(json); //string to json
      return sourceRecommended;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  static Future<SourceSearch> getSearch({String? searchKey}) async {
    https: //api.themoviedb.org/3/search/movie?api_key=fb7eef06b1a6f1388c140740a88d5b46&language=en-US&query=q&page=1&include_adult=false
    var url = Uri.https(baseUrl, '/3/search/movie', {
      'api_key': 'fb7eef06b1a6f1388c140740a88d5b46',
      'query': searchKey,
    });
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString); //string
      var sourceSearch = SourceSearch.fromJson(json); //string to json
      return sourceSearch;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  static Future<SourceDetails> getDetails(int movieId) async {
    var url = Uri.https(baseUrl, '/3/movie/$movieId', {
      'api_key': 'fb7eef06b1a6f1388c140740a88d5b46',
    });
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString); //string
      var sourceDetails = SourceDetails.fromJson(json); //string to json
      return sourceDetails;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  static Future<SourceSimilar> getSimilar(num movieId) async {
    https: //api.themoviedb.org/3/movie/3521/similar?api_key=fb7eef06b1a6f1388c140740a88d5b46&language=en-US&page=1
    var url = Uri.https(baseUrl, '/3/movie/$movieId/similar', {
      'api_key': 'fb7eef06b1a6f1388c140740a88d5b46',
    });
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString); //string
      var sourceSimilar = SourceSimilar.fromJson(json); //string to json
      return sourceSimilar;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  static Future<SourceGeners> getGeners() async {
    https: //api.themoviedb.org/3/genre/movie/list?api_key=fb7eef06b1a6f1388c140740a88d5b46&language=en-US
    var url = Uri.https(baseUrl, '/3/genre/movie/list', {
      'api_key': 'fb7eef06b1a6f1388c140740a88d5b46',
    });
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString); //string
      var sourceGeners = SourceGeners.fromJson(json); //string to json
      return sourceGeners;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  static Future<SourceDiscover> getDiscover(String with_genres) async {
    https: //api.themoviedb.org/3/discover/movie?api_key=fb7eef06b1a6f1388c140740a88d5b46&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate
    var url = Uri.https(baseUrl, '/3/discover/movie', {
      'api_key': 'fb7eef06b1a6f1388c140740a88d5b46',
      'with_genres': with_genres,
    });
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString); //string
      var sourceDiscover = SourceDiscover.fromJson(json); //string to json
      return sourceDiscover;
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
