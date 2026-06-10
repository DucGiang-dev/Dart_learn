import 'package:lab6/models/movie.dart';

const List<Movie> allMovies = [
  Movie(
    title: 'Inception',
    year: 2010,
    genres: ['Action', 'Sci-Fi'],
    posterUrl: 'https://picsum.photos/seed/inception/200/300',
    rating: 8.8,
  ),
  Movie(
    title: 'The Dark Knight',
    year: 2008,
    genres: ['Action', 'Drama'],
    posterUrl: 'https://picsum.photos/seed/darkknight/200/300',
    rating: 9.0,
  ),
  Movie(
    title: 'Interstellar',
    year: 2014,
    genres: ['Drama', 'Sci-Fi'],
    posterUrl: 'https://picsum.photos/seed/interstellar/200/300',
    rating: 8.6,
  ),
  Movie(
    title: 'Pulp Fiction',
    year: 1994,
    genres: ['Crime', 'Drama'],
    posterUrl: 'https://picsum.photos/seed/pulp/200/300',
    rating: 8.9,
  ),
  Movie(
    title: 'The Matrix',
    year: 1999,
    genres: ['Action', 'Sci-Fi'],
    posterUrl: 'https://picsum.photos/seed/matrix/200/300',
    rating: 8.7,
  ),
  Movie(
    title: 'Parasite',
    year: 2019,
    genres: ['Comedy', 'Drama', 'Thriller'],
    posterUrl: 'https://picsum.photos/seed/parasite/200/300',
    rating: 8.5,
  ),
];

const List<String> availableGenres = [
  'Action',
  'Drama',
  'Sci-Fi',
  'Crime',
  'Comedy',
  'Thriller',
];

const List<String> sortOptions = ['A-Z', 'Z-A', 'Year', 'Rating'];
