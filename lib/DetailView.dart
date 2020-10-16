import 'package:flutter/material.dart';
import 'package:ynov/movie.dart';
import 'package:ynov/fetchMovieDetails.dart';

class DetailView extends StatelessWidget {
  final int id;
  final int type;

  DetailView({this.id, this.type});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Movie>(
      future: fetchMovieDetails(id, type),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
            ),
            body: Stack(
              fit: StackFit.expand,
              alignment: Alignment.bottomCenter,
              children: [
                Image.network(snapshot.data.posterPath, fit: BoxFit.fitHeight),
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 2.5),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0, 0.25],
                      colors: [
                        Colors.transparent,
                        Colors.blueGrey[900],
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 88.0, left: 10, right: 10, bottom: 20),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data.title,
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 3),
                        Wrap(
                          spacing: 9,
                          children: [
                            Text(
                              "+15",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              " - ",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              // snapshot.data.releaseDate.toString(),
                              DateTime.parse(snapshot.data.releaseDate).year.toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              " - ",
                              style: TextStyle(color: Colors.white),
                            ),
                            Icon(Icons.star, color: Colors.yellow, size: 17),
                            Text(
                              snapshot.data.voteAverage.toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Wrap(
                          children: [
                            Card(
                              margin: EdgeInsets.only(top: 11),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text("Crime"),
                              ),
                            ),
                            Card(
                              margin: EdgeInsets.only(top: 11, left: 15),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text("Drama"),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Wrap(children: [
                          RichText(
                            text: TextSpan(
                              text: "Overview : ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                              children: <TextSpan>[
                                TextSpan(
                                    text: snapshot.data.overview,
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal))
                              ],
                            ),
                          ),
                          // FutureMovie(),
                        ]),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.error);
        }

        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
