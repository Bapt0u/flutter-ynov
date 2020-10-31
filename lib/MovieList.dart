import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ynov/getMovieList.dart';
import 'package:ynov/movie.dart';

import 'DetailView.dart';

class FutureMovie extends StatelessWidget {
  Future<Movie> futureMovie;

  //Type of content,
  // 0 : Movie
  // 1 : TV show
  int type;
  FutureMovie({this.type});

  Widget build(BuildContext context) {
    return FutureBuilder<List<Movie>>(
        future: getMovieList(type),
        builder: (context, snapshot) {
          print(snapshot.error);
          if (snapshot.hasData) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailView(
                                  id: snapshot.data[index].id,
                                  type: type,
                                )));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 7, top: 12, right: 7, bottom: 12),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 7,
                            offset: Offset(0, 0), // changes position of shadow
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          snapshot.data[index].posterPath,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
          // } else if (snapshot.hasError) {
          //   return Text("${snapshot.error}");
          // }

          return Center(child: CircularProgressIndicator());
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
        child: Padding(
          padding: const EdgeInsets.all(5.0),
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
                child: FutureMovie(type: 0),
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
                child: FutureMovie(type: 1),
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
      ),
    );
  }
}
