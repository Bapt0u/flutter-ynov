import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Image Demo',
      home: Scaffold(
        // appBar: AppBar(
        //   title: const Text('[Return Button here]'),
        //   backgroundColor: Colors.transparent,
        // ),
        body: Stack(
          // alignment: Alignment.bottomLeft,
          // fit: StackFit.loose,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('image/kungfury.jpg'),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Positioned(
              
              // bottom: 0,
                child: Container(
                    // alignment: Alignment.bottomLeft,
                    // width: 50,
                    // height : MediaQuery.of(context).size.height *0.5,
                    height: 200,
                    color: Colors.black,
                    child: Column(
                      children: [
                        Text(
                          "Enola Holmes",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 40),
                        ),
                        Text("Etoiles"),
                        Stack(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Crime",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        backgroundColor: Colors.white),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "Drama",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        backgroundColor: Colors.white),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "Mystery",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      backgroundColor: Colors.white,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Expanded(child: Text("")),
                                Expanded(child: Text(""))
                              ],
                            )
                          ],
                        )
                      ],
                    )))
          ],
        ),
      ),
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
