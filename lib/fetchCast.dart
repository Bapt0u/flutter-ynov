import 'dart:async';
import 'dart:convert';
import 'package:ynov/movie.dart';

import 'package:http/http.dart' as http;

Future<List<String>> fetchCast(int id, int type) async {
  List<String> castList;
  String url;

  if (type == 0) {
    url =
        "https://api.themoviedb.org/3/movie/${id.toString()}/credits?api_key=62feaff3d2cf094a340f530fbf25bde9";
  } else if (type == 1) {
    url =
        "https://api.themoviedb.org/3/movie/${id.toString()}/credits?api_key=62feaff3d2cf094a340f530fbf25bde9";
  }

  final response = await http.get(url);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var jsonResponse = jsonDecode(response.body);

    castList = Movie.fromJson(jsonResponse);

    return castList;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    // throw Exception('Failed to load details');
  }
}
