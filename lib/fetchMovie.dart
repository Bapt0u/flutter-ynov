import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ynov/movie.dart';

// import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Movie>> fetchMovie() async {
  List<Movie> movieList = [];
  final response = await http.get(
      "https://api.themoviedb.org/3/trending/all/day?api_key=62feaff3d2cf094a340f530fbf25bde9");

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var jsonResponse = jsonDecode(response.body)["results"];
    print(response.body);

    for(var i in jsonResponse){
      movieList.add(Movie.fromJson(i));
    }

    return movieList;
    //return Movie.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Movie');
  }
}

// class FutureMovie extends StatelessWidget {
//   Future<Movie> futureMovie;

//   Widget build(BuildContext context) {
//     return FutureBuilder<Movie>(
//         future: futureMovie,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             return Text(snapshot.data.title);
//           } else if (snapshot.hasError) {
//             return Text("${snapshot.error}");
//           }

//           return CircularProgressIndicator();
//         });
//   }
// }
