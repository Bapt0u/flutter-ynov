import 'dart:async';
import 'dart:convert';
import 'package:ynov/movie.dart';

import 'package:http/http.dart' as http;

Future<List<Movie>> getBestMovies() async {
  List<Movie> movieList = [];
  String url = "https://api.themoviedb.org/3/movie/top_rated?api_key=62feaff3d2cf094a340f530fbf25bde9&page=1";

  final response = await http.get(
      url);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    // print(response.body);
    var jsonResponse = jsonDecode(response.body)["results"];
    
    for (var i in jsonResponse) {
      movieList.add(Movie.fromJson(i));
    }

    return movieList;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Movie');
  }
}
