class Movie {
  String title;
  String overview;
  String posterPath;
  int id;
  double voteAverage;
  String releaseDate;
  // String tags;

  Movie({
    this.title,
    this.overview,
    this.posterPath,
    this.id,
    this.voteAverage,
    this.releaseDate,
    // this.tags,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    print(json);
    return Movie(
      title: json["title"] != null ? json["title"] : json["name"],
      overview: json["overview"],
      posterPath: "https://image.tmdb.org/t/p/w500/${json["poster_path"]}",
      id: json["id"],
      voteAverage: json["vote_average"],
      releaseDate:
          json["release_date"] != null ? json["release_date"] : "1967-02-20",
      // tags: json["genres"]["name"],
    );
  }
}

class MovieDetails {
  String title;
  String overview;
  String posterPath;
  double popularity;
  List<String> tags;

  MovieDetails({
    this.title,
    this.overview,
    this.popularity,
    this.posterPath,
    // this.tags,
  });

  factory MovieDetails.fromJson(Map<String, dynamic> json) {
    return MovieDetails(
      title: json["title"] != null ? json["title"] : json["name"],
      overview: json["overview"],
      posterPath: "https://image.tmdb.org/t/p/w500/${json["poster_path"]}",
      popularity: json["popularity"],
      // tags: json["genres"],
    );
  }
}
