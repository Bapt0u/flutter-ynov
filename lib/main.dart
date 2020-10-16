import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ynov/MovieList.dart';
// import 'package:ynov/DetailView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ynov Flutter',
      home: MovieList(),
    );
  }
}

// var category = Container(
//     child: Row(
//   children: [
//     Expanded(
//       child: Text(
//         "Crime",
//         style: TextStyle(
//             fontSize: 20, color: Colors.black, backgroundColor: Colors.white),
//       ),
//     )
//   ],
// ));

// Text(
//                             "Crime",
//                             textAlign: TextAlign.justify,
//                             style: TextStyle(
//                                 fontSize: 15,
//                                 color: Colors.black,
//                                 backgroundColor: Colors.white),
//                           ),
