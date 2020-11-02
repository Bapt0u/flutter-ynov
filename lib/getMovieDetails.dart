import 'dart:async';
import 'dart:convert';
import 'package:ynov/movie.dart';

import 'package:http/http.dart' as http;

Future<MovieDetails> fetchMovieDetails(int id, int type) async {
  MovieDetails moviedetails;
  String url;

  /*
  *  Si la cible est un type 1, alors c'est un TV SHOW.
  *  Sinon, c'est un MOVIE
  *  Le type 0 est un Film en trending,
  *  Le type 2 est un film en Best.
  */
  String typeString = type == 1 ? "tv" : "movie";

  url = "https://api.themoviedb.org/3/$typeString/" +
      id.toString() +
      "?api_key=62feaff3d2cf094a340f530fbf25bde9";

  final response = await http.get(url);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var jsonResponse = jsonDecode(response.body);

    moviedetails = MovieDetails.fromJson(jsonResponse);

    final responseCast = await http.get(
        "https://api.themoviedb.org/3/$typeString/$id/credits?api_key=62feaff3d2cf094a340f530fbf25bde9");

    // var jsonResponse2 = jsonDecode(responseCast.body);
    moviedetails.castingList(jsonDecode(responseCast.body)["cast"]);
    // print(moviedetails);
    return moviedetails;
  } else {
    print("Cannot load page");
    throw Exception('Failed to load details');
  }
}
