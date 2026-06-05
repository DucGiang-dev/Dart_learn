class Trailer {
  final String id;
  final String name;

  Trailer({
    required this.id,
    required this.name,
  });
}

class Movie {
  final String id;
  final String title;
  final String posterUrl;
  final String overview;
  final double rating;
  final List<String> genres;
  final List<Trailer> trailers;
  bool isFavorite;

  Movie({
    required this.id,
    required this.title,
    required this.posterUrl,
    required this.overview,
    required this.rating,
    required this.genres,
    required this.trailers,
    this.isFavorite = false,
  });
}
