import 'package:flutter/material.dart';
import 'app.dart';

import 'package:firebase_core/firebase_core.dart';

void main() => runApp(Init());

class Init extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MyApp();
        }

        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
