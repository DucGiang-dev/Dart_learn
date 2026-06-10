# Lab 6 Responsive Movie Browser Refactor Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Split the long `lib/main.dart` implementation for Lab 6 into focused Dart files while preserving the existing responsive movie browsing behavior.

**Architecture:** `main.dart` will only bootstrap the app. Movie data and model move to data/model files. The screen owns search, genre, and sort state. Movie card and supporting UI widgets move to widget files. This keeps the app single-demo in behavior while improving readability.

**Tech Stack:** Flutter, Dart, no third-party packages.

---

### Task 1: Move model and sample data out of main.dart

**Files:**
- Create: `lib/models/movie.dart`
- Create: `lib/data/movie_data.dart`
- Modify: `lib/main.dart`

- [ ] **Step 1: Create the Movie model**

```dart
class Movie {
  final String title;
  final int year;
  final List<String> genres;
  final String posterUrl;
  final double rating;

  const Movie({
    required this.title,
    required this.year,
    required this.genres,
    required this.posterUrl,
    required this.rating,
  });
}
```

- [ ] **Step 2: Create sample data constants**

```dart
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
```

- [ ] **Step 3: Keep main.dart as the app entry point**

```dart
import 'package:flutter/material.dart';

import 'package:lab6/screens/genre_screen.dart';

void main() {
  runApp(const ResponsiveMovieApp());
}

class ResponsiveMovieApp extends StatelessWidget {
  const ResponsiveMovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Browser',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const GenreScreen(),
    );
  }
}
```

---

### Task 2: Move the responsive screen state and layout to its own file

**Files:**
- Create: `lib/screens/genre_screen.dart`

- [ ] **Step 1: Create `GenreScreen` with filtering and sorting**

```dart
import 'package:flutter/material.dart';

import 'package:lab6/data/movie_data.dart';
import 'package:lab6/models/movie.dart';
import 'package:lab6/widgets/movie_card.dart';

class GenreScreen extends StatefulWidget {
  const GenreScreen({super.key});

  @override
  State<GenreScreen> createState() => _GenreScreenState();
}

class _GenreScreenState extends State<GenreScreen> {
  String searchQuery = '';
  Set<String> selectedGenres = {};
  String selectedSort = sortOptions.first;

  List<Movie> get visibleMovies {
    final query = searchQuery.trim().toLowerCase();
    final filtered = allMovies.where((movie) {
      final matchesSearch = query.isEmpty ||
          movie.title.toLowerCase().contains(query);
      final matchesGenres = selectedGenres.isEmpty ||
          movie.genres.any((genre) => selectedGenres.contains(genre));

      return matchesSearch && matchesGenres;
    }).toList();

    filtered.sort((a, b) {
      switch (selectedSort) {
        case 'A-Z':
          return a.title.compareTo(b.title);
        case 'Z-A':
          return b.title.compareTo(a.title);
        case 'Year':
          return b.year.compareTo(a.year);
        case 'Rating':
          return b.rating.compareTo(a.rating);
        default:
          return 0;
      }
    });

    return filtered;
  }

  @override
  Widget build(BuildContext context) {
    final movies = visibleMovies;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Find a Movie'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search movies...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Text(
                    'Genres',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 8),
                  Badge(label: Text('${selectedGenres.length}')),
                  const Spacer(),
                  TextButton(
                    onPressed: selectedGenres.isEmpty
                        ? null
                        : () {
                            setState(() {
                              selectedGenres.clear();
                            });
                          },
                    child: const Text('Clear filters'),
                  ),
                ],
              ),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: availableGenres.map((genre) {
                  final isSelected = selectedGenres.contains(genre);

                  return FilterChip(
                    label: Text(genre),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          selectedGenres.add(genre);
                        } else {
                          selectedGenres.remove(genre);
                        }
                      });
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Movies found: ${movies.length}'),
                  DropdownButton<String>(
                    value: selectedSort,
                    onChanged: (String? newValue) {
                      if (newValue == null) {
                        return;
                      }

                      setState(() {
                        selectedSort = newValue;
                      });
                    },
                    items: sortOptions
                        .map(
                          (option) => DropdownMenuItem<String>(
                            value: option,
                            child: Text(option),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth < 800) {
                      return ListView.builder(
                        itemCount: movies.length,
                        itemBuilder: (context, index) {
                          return MovieCard(movie: movies[index]);
                        },
                      );
                    }

                    return GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 0.72,
                      children: movies.map((movie) {
                        return MovieCard(movie: movie);
                      }).toList(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

---

### Task 3: Move movie card presentation into widget files

**Files:**
- Create: `lib/widgets/movie_card.dart`
- Create: `lib/widgets/poster_image.dart`
- Create: `lib/widgets/genre_tags.dart`

- [ ] **Step 1: Create the poster widget**

```dart
import 'package:flutter/material.dart';

class PosterImage extends StatelessWidget {
  final String posterUrl;
  final double width;
  final double height;

  const PosterImage({
    super.key,
    required this.posterUrl,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        posterUrl,
        width: width,
        height: height,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }

          return SizedBox(
            width: width,
            height: height,
            child: const Center(child: CircularProgressIndicator()),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return SizedBox(
            width: width,
            height: height,
            child: const Icon(Icons.movie),
          );
        },
      ),
    );
  }
}
```

- [ ] **Step 2: Create the genre tags widget**

```dart
import 'package:flutter/material.dart';

class GenreTags extends StatelessWidget {
  final List<String> genres;

  const GenreTags({super.key, required this.genres});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 4,
      runSpacing: 4,
      children: genres
          .map(
            (genre) => Chip(
              label: Text(
                genre,
                style: const TextStyle(fontSize: 10),
              ),
              padding: EdgeInsets.zero,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          )
          .toList(),
    );
  }
}
```

- [ ] **Step 3: Create the movie card widget**

```dart
import 'package:flutter/material.dart';

import 'package:lab6/models/movie.dart';
import 'package:lab6/widgets/genre_tags.dart';
import 'package:lab6/widgets/poster_image.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isCompact = constraints.maxWidth < 220;
        final posterWidth = isCompact ? 72.0 : 112.0;
        final posterHeight = isCompact ? 108.0 : 168.0;

        return Card(
          clipBehavior: Clip.antiAlias,
          child: isCompact
              ? CompactMovieCardContent(
                  movie: movie,
                  posterWidth: posterWidth,
                  posterHeight: posterHeight,
                )
              : WideMovieCardContent(
                  movie: movie,
                  posterHeight: posterHeight,
                ),
        );
      },
    );
  }
}

class CompactMovieCardContent extends StatelessWidget {
  final Movie movie;
  final double posterWidth;
  final double posterHeight;

  const CompactMovieCardContent({
    super.key,
    required this.movie,
    required this.posterWidth,
    required this.posterHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PosterImage(
            posterUrl: movie.posterUrl,
            width: posterWidth,
            height: posterHeight,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 4),
                Text('Year: ${movie.year}'),
                Text('Rating: ${movie.rating.toStringAsFixed(1)}'),
                const SizedBox(height: 8),
                GenreTags(genres: movie.genres),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WideMovieCardContent extends StatelessWidget {
  final Movie movie;
  final double posterHeight;

  const WideMovieCardContent({
    super.key,
    required this.movie,
    required this.posterHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PosterImage(
            posterUrl: movie.posterUrl,
            width: double.infinity,
            height: posterHeight,
          ),
          const SizedBox(height: 8),
          Text(
            movie.title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 4),
          Text('Year: ${movie.year}'),
          Text('Rating: ${movie.rating.toStringAsFixed(1)}'),
          const SizedBox(height: 8),
          GenreTags(genres: movie.genres),
        ],
      ),
    );
  }
}
```

---

### Task 4: Verify the refactor

**Files:**
- `lib/main.dart`
- `lib/data/movie_data.dart`
- `lib/models/movie.dart`
- `lib/screens/genre_screen.dart`
- `lib/widgets/movie_card.dart`
- `lib/widgets/poster_image.dart`
- `lib/widgets/genre_tags.dart`

- [ ] **Step 1: Run Flutter analyzer**

Run:

```bash
flutter analyze
```

Expected: No analyzer errors.

- [ ] **Step 2: Run Flutter tests**

Run:

```bash
flutter test
```

Expected: Existing tests pass, or if no tests exist, the command reports that no tests were found.
