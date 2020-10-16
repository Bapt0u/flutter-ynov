import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ynov/fetchMovieList.dart';

class FutureTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Le premier paramètre est la future contenant
      // la valeur que l'on souhaite récuperer.
      // future: Future.delayed(Duration(seconds: 3)),
      future: fetchMovieList(),

      // La fonction de build permet d'afficher un widget en fonction
      // du résultat contenun dans snapshot
      builder: (context, snapshot) {
        Map<String, dynamic> tmdb = jsonDecode(snapshot.data);

        // Tant que le Future n'a pas renvoyé de valeur, on peux
        // afficher un widget temporaire
        if (snapshot.connectionState != ConnectionState.done) {
          return Text("Future en cours");
          // On peux vérifier qu'une erreur n'est pas survenue
        } else if (snapshot.hasError) {
          return Text("Une erreur est survenue");
        }
        // Une fois le Future terminé, et qu'aucune erreur ne s'est
        // produite, on peux afficher les résultats
        else {
          return Text(
            tmdb["overview"],
            style: TextStyle(fontSize: 14, color: Colors.white),
          );
        }
      },
    );
  }
}
