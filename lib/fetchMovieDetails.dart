import 'dart:async';
import 'dart:convert';
import 'package:ynov/movie.dart';

import 'package:http/http.dart' as http;

Future<Movie> fetchMovieDetails(int id, int type) async {
  Movie moviedetails;
  String url;

  if(type == 0){
    url = "https://api.themoviedb.org/3/movie/" +
      id.toString() +
      "?api_key=62feaff3d2cf094a340f530fbf25bde9";
  } else if (type == 1){
    url = "https://api.themoviedb.org/3/tv/" +
      id.toString() +
      "?api_key=62feaff3d2cf094a340f530fbf25bde9";
  }

  final response = await http.get(url);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var jsonResponse = jsonDecode(response.body);

    moviedetails = Movie.fromJson(jsonResponse);

    return moviedetails;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    // throw Exception('Failed to load details');
  }
}
