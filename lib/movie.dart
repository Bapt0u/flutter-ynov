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
    print(json);
    return Movie(
      // title: json["title"] != null ? json["title"] : json["name"],
      overview: json["overview"],
      posterPath: "https://image.tmdb.org/t/p/w500/${json["poster_path"]}",
      id: json["id"],
      // voteAverage: json["vote_average"],
      // releaseDate:
          // json["release_date"] != null ? json["release_date"] : "1967-02-20",
    );
  }
}

class MovieDetails {
  String title;
  String overview;
  String posterPath;
  double voteAverage;
  List<dynamic> tags;
  String releaseDate;

  MovieDetails({
    this.title,
    this.overview,
    this.voteAverage,
    this.posterPath,
    this.tags,
    this.releaseDate,
  });

  factory MovieDetails.fromJson(Map<String, dynamic> json) {
    return MovieDetails(
      title: json["title"] != null ? json["title"] : json["name"],
      overview: json["overview"],
      posterPath: "https://image.tmdb.org/t/p/w500/${json["poster_path"]}",
      voteAverage: json["vote_average"],
      tags: json["genres"],
      releaseDate: json["release_date"] != null ? json["release_date"] : json["first_air_date"],
    );
  }
}
