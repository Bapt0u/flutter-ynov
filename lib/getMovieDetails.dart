import 'dart:async';
import 'dart:convert';
import 'package:ynov/movie.dart';

import 'package:http/http.dart' as http;

Future<MovieDetails> fetchMovieDetails(int id, int type) async {
  MovieDetails moviedetails;
  String url;

  if (type == 0) {
    url = "https://api.themoviedb.org/3/movie/" +
        id.toString() +
        "?api_key=62feaff3d2cf094a340f530fbf25bde9";
  } else if (type == 1) {
    url = "https://api.themoviedb.org/3/tv/" +
        id.toString() +
        "?api_key=62feaff3d2cf094a340f530fbf25bde9";
  } else if (type == 2) {
    url = "https://api.themoviedb.org/3/movie/" +
        id.toString() +
        "?api_key=62feaff3d2cf094a340f530fbf25bde9";
  }

  final response = await http.get(url);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var jsonResponse = jsonDecode(response.body);

    moviedetails = MovieDetails.fromJson(jsonResponse);

    final responseCast = await http.get(
        "https://api.themoviedb.org/3/movie/$id/credits?api_key=62feaff3d2cf094a340f530fbf25bde9");

    // var jsonResponse2 = jsonDecode(responseCast.body);
    moviedetails.castingList(jsonDecode(responseCast.body)["cast"]);
    // print(moviedetails);
    return moviedetails;
    
  } else {
    print("Cannot load page");
    throw Exception('Failed to load details');
  }
}
