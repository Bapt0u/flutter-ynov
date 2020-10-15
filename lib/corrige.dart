import 'package:flutter/material.dart';
import 'package:imdbViewer/model/MovieFull.dart';
import 'package:imdbViewer/repository/MovieRepository.dart';
import 'package:imdbViewer/utils.dart';

class MovieDetail extends StatelessWidget {
  final int id;

  MovieDetail({@required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: Color(0xff2c2c2c),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: FutureBuilder<MovieFull>(
          future: MovieRepository().fetchMovieDetails(id),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Stack(
              fit: StackFit.expand,
              alignment: Alignment.bottomCenter,
              children: [
                Image.network(
                  TMDB.BASE_IMAGE_URL + "/original" + snapshot.data.poster,
                  fit: BoxFit.cover,
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 1.5,
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 2.5),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0, 0.3],
                      colors: [
                        Colors.transparent,
                        Color(0xff2c2c2c),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, top: 70, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data.title,
                          style: TextStyle(
                            color: Color(0xfffefeff),
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Wrap(
                          spacing: 10,
                          children: [
                            Text(
                              "15+",
                              style: TextStyle(
                                color: Color(0xfffefeff),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "-",
                              style: TextStyle(
                                color: Color(0xfffefeff),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              DateTime.parse(snapshot.data.date)
                                  .year
                                  .toString(),
                              style: TextStyle(
                                color: Color(0xfffefeff),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "-",
                              style: TextStyle(
                                color: Color(0xfffefeff),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              Icons.star,
                              color: Color(0xffe6ba8a),
                              size: 18,
                            ),
                            Text(
                              snapshot.data.rating.toString(),
                              style: TextStyle(
                                color: Color(0xffe6ba8a),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        Wrap(
                          spacing: 10,
                          children: snapshot.data.tags
                              .map(
                                (tag) => Chip(
                                  label: Text(
                                    tag,
                                    style: TextStyle(
                                      color: Color(0xff2c2c2c),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  backgroundColor: Color(0xfffefeff),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                ),
                              )
                              .toList(),
                        ),
                        SizedBox(height: 20),
                        RichText(
                          text: TextSpan(
                            text: "Cast:  ",
                            style: TextStyle(
                              color: Color(0xfffefeff),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            children: snapshot.data.actors
                                .sublist(0, 4)
                                .map(
                                  (actor) => TextSpan(
                                    text: "$actor  ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Summary",
                          style: TextStyle(
                            color: Color(0xfffefeff),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          snapshot.data.description,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 6,
                          style: TextStyle(
                            color: Color(0xfffefeff),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
