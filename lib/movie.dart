class Movie {
  String title;
  String overview;
  String posterPath;
  int id;
  double voteAverage;
  String releaseDate;

  Movie({this.title, this.overview, this.posterPath, this.id, this.voteAverage, this.releaseDate});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        title: json["title"] != null ? json["title"] : json["name"],
        overview: json["overview"],
        posterPath: "https://image.tmdb.org/t/p/w500/${json["poster_path"]}",
        id: json["id"],
        voteAverage: json["vote_average"],
        releaseDate: json["release_date"] != null ? json["release_date"] : "1967-02-20",
        );
  }
}

class MovieDetails {
  String title;
  String overview;
  String posterPath;
  double popularity;

  MovieDetails({this.title, this.overview, this.popularity, this.posterPath});
  factory MovieDetails.fromJson(Map<String, dynamic> json) {
    return MovieDetails(
      title: json["title"] != null ? json["title"] : json["name"],
      overview: json["overview"],
      posterPath: "https://image.tmdb.org/t/p/w500/${json["poster_path"]}",
      popularity: json["popularity"],
    );
  }
}
