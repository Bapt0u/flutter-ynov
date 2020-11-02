class Movie {
  String title;
  String overview;
  String posterPath;
  int id;
  double voteAverage;
  String releaseDate;

  Movie({
    this.title,
    this.overview,
    this.posterPath,
    this.id,
    this.voteAverage,
    this.releaseDate,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    // print(json);
    return Movie(
      overview: json["overview"],
      posterPath: "https://image.tmdb.org/t/p/w500/${json["poster_path"]}",
      id: json["id"],
    );
  }
}

class MovieDetails extends Movie {
  String title;
  String overview;
  String posterPath;
  double voteAverage;
  List<dynamic> tags;
  String releaseDate;
  List<String> characters = [];

  MovieDetails({
    this.title,
    this.overview,
    this.voteAverage,
    this.posterPath,
    this.releaseDate,
    this.tags,
  });

  castingList(List<dynamic> list) {
    int max = 5;
    if (list?.isEmpty ?? true) {
      characters.add("Unknown...");
      max = 0;
    } else if (list.length < 5) {
      max = list.length;
    }

    for (int i = 0; i < max; i++) {
      if (i == max - 1) {
        characters.add(" ${list[i]["name"]}");
        break;
      }
      characters.add(" ${list[i]["name"]},");
    }
    // print(characters);
  }

  factory MovieDetails.fromJson(Map<String, dynamic> json) {
    return MovieDetails(
      title: json["title"] != null ? json["title"] : json["name"],
      overview: json["overview"],
      posterPath: "https://image.tmdb.org/t/p/w500/${json["poster_path"]}",
      voteAverage: json["vote_average"],
      tags: json["genres"],
      releaseDate: json["release_date"] != null
          ? json["release_date"]
          : json["first_air_date"],
    );
  }
}