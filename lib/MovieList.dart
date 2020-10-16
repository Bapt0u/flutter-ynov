import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ynov/fetchMovie.dart';
import 'package:ynov/futureTest.dart';
import 'package:ynov/movie.dart';

import 'DetailView.dart';

class FutureMovie extends StatelessWidget {
  Future<Movie> futureMovie;

  Widget build(BuildContext context) {
    return FutureBuilder<List<Movie>>(
        future: fetchMovie(),
        builder: (context, snapshot) {
          print(snapshot);
          if (snapshot.hasData) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => FutureTest()));
                  },
                  child: Image.network(snapshot.data[index].posterPath),
                  // child: (FutureMovie()),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          return CircularProgressIndicator();
        });
  }
}

class MovieList extends StatelessWidget {
  final List a = ["image/Kung_Fury_Poster.png", "image/enolaholmes.jpg"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      // ),

      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Popular Movies',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              // Création de la liste de Popular movie
              child: FutureMovie(),
            ),
            Text(
              'Popular TV Shows',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: a.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailView()));
                      },
                      child: Image.asset(a[index]));
                },
              ),
            ),
            Text(
              'Best Movies',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: a.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailView()));
                      },
                      child: Image.asset(a[index]));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
