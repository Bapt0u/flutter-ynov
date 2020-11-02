import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ynov/movieList.dart';
import 'login.dart';
import 'register.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'LowCost Netflix',

      home: MovieList(),

      initialRoute: '/login',
      onGenerateRoute: _getRoute,
    );
  }
}

Route<dynamic> _getRoute(RouteSettings settings){
  if(settings.name != "/login"){
    return null;
  }

  return MaterialPageRoute(
      settings: settings,
      builder: (BuildContext context) => LoginPage(),
      fullscreenDialog: true,
    );
}
