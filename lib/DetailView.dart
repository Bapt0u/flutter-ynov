import 'package:flutter/material.dart';
// import 'package:ynov/TestRepo.dart';
import 'package:ynov/futureTest.dart';
import 'package:ynov/fetchMovie.dart';

class DetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          Image.asset('image/enolaholmes.jpg', fit: BoxFit.fitHeight),
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 2.5),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0, 0.3],
                colors: [
                  Colors.transparent,
                  Colors.blueGrey[800],
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
                    "Enola Holmes",
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
                        "2020",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        " - ",
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(Icons.star, color: Colors.yellow, size: 17),
                      Text(
                        "4.8",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Wrap(
                    children: [
                      Card(
                        child: Text("Crime"),
                      ),
                      Card(
                        child: Text("Drama"),
                      ),
                    ],
                  ),
                  Wrap(children: [
                    // FutureMovie(),
                  ]),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
