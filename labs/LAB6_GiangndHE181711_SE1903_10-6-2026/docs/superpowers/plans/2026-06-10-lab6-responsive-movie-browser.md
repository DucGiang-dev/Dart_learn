# Lab 6 Responsive Movie Genre Browsing Screen Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Build a single-file Flutter app for Lab 6 that displays a responsive movie genre browsing screen with search, genre filtering, sorting, and phone/tablet layout adaptation.

**Architecture:** `lib/main.dart` will contain one Flutter app: `ResponsiveMovieApp` hosts `GenreScreen`; `GenreScreen` owns search, selected genres, sort state, filtering/sorting logic, and responsive layout. `Movie` is a simple immutable model, and `allMovies` provides sample data. The UI uses `SafeArea`, `Wrap`, `Expanded`, `LayoutBuilder`, `ListView`, and `GridView.count`.

**Tech Stack:** Flutter, Dart, `flutter_test`.

---

### Task 1: Replace the broken single-file app structure

**Files:**
- Modify: `lib/main.dart`
- Test: `test/responsive_movie_screen_test.dart`

- [ ] **Step 1: Write the failing test**

Create `test/responsive_movie_screen_test.dart` with this test:

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:lab6/main.dart';

void main() {
  test('sample movie data is available', () {
    expect(allMovies, hasLength(6));
    expect(allMovies.first.title, 'Inception');
    expect(allMovies.first.genres, contains('Action'));
  });
}
```

- [ ] **Step 2: Run test to verify it fails**

Run:

```bash
flutter test test/responsive_movie_screen_test.dart
```

Expected: FAIL because the current `lib/main.dart` contains duplicate invalid template code after the Lab 6 code.

- [ ] **Step 3: Write minimal implementation**

Replace the full contents of `lib/main.dart` with this valid single-file app:

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const ResponsiveMovieApp());
}

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

class GenreScreen extends StatefulWidget {
  const GenreScreen({super.key});

  @override
  State<GenreScreen> createState() => _GenreScreenState();
}

class _GenreScreenState extends State<GenreScreen> {
  String searchQuery = '';
  Set<String> selectedGenres = {};
  String selectedSort = 'A-Z';

  final List<String> availableGenres = const [
    'Action',
    'Drama',
    'Sci-Fi',
    'Crime',
    'Comedy',
    'Thriller',
  ];

  final List<String> sortOptions = const ['A-Z', 'Z-A', 'Year', 'Rating'];

  List<Movie> get visibleMovies {
    final query = searchQuery.trim().toLowerCase();

    final filtered = allMovies.where((movie) {
      final matchesSearch = query.isEmpty || movie.title.toLowerCase().contains(query);
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
                  Badge(
                    label: Text('${selectedGenres.length}'),
                  ),
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

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final posterWidth = constraints.maxWidth < 220
            ? 72.0
            : 112.0;
        final posterHeight = constraints.maxWidth < 220
            ? 108.0
            : 168.0;

        return Card(
          clipBehavior: Clip.antiAlias,
          child: constraints.maxWidth < 220
              ? Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          movie.posterUrl,
                          width: posterWidth,
                          height: posterHeight,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }

                            return SizedBox(
                              width: posterWidth,
                              height: posterHeight,
                              child: const Center(child: CircularProgressIndicator()),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return SizedBox(
                              width: posterWidth,
                              height: posterHeight,
                              child: const Icon(Icons.movie),
                            );
                          },
                        ),
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
                            Wrap(
                              spacing: 4,
                              runSpacing: 4,
                              children: movie.genres
                                  .map(
                                    (genre) => Chip(
                                      label: Text(
                                        genre,
                                        style: const TextStyle(fontSize: 10),
                                      ),
                                      padding: EdgeInsets.zero,
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                    ),
                                  )
                                  .toList(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          movie.posterUrl,
                          width: double.infinity,
                          height: posterHeight,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }

                            return SizedBox(
                              width: double.infinity,
                              height: posterHeight,
                              child: const Center(child: CircularProgressIndicator()),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return SizedBox(
                              width: double.infinity,
                              height: posterHeight,
                              child: const Icon(Icons.movie),
                            );
                          },
                        ),
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
                      Wrap(
                        spacing: 4,
                        runSpacing: 4,
                        children: movie.genres
                            .map(
                              (genre) => Chip(
                                label: Text(
                                  genre,
                                  style: const TextStyle(fontSize: 10),
                                ),
                                padding: EdgeInsets.zero,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
```

- [ ] **Step 4: Run test to verify it passes**

Run:

```bash
flutter test test/responsive_movie_screen_test.dart
```

Expected: PASS.

- [ ] **Step 5: Commit**

Run:

```bash
git add lib/main.dart test/responsive_movie_screen_test.dart
git commit -m "feat: build responsive movie browser"
```

---

### Task 2: Add widget tests for filtering and sorting

**Files:**
- Modify: `test/responsive_movie_screen_test.dart`

- [ ] **Step 1: Write failing tests**

Add these tests:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab6/main.dart';

void main() {
  testWidgets('search filters movies by title case-insensitively',
      (tester) async {
    await tester.pumpWidget(const ResponsiveMovieApp());

    await tester.enterText(find.byType(TextField), 'matrix');
    await tester.pump();

    expect(find.text('The Matrix'), findsOneWidget);
    expect(find.text('Inception'), findsNothing);
  });

  testWidgets('genre chips filter movies by selected genre', (tester) async {
    await tester.pumpWidget(const ResponsiveMovieApp());

    await tester.tap(find.text('Sci-Fi'));
    await tester.pump();

    expect(find.text('Inception'), findsOneWidget);
    expect(find.text('The Dark Knight'), findsNothing);
  });

  testWidgets('sort dropdown orders movies by rating', (tester) async {
    await tester.pumpWidget(const ResponsiveMovieApp());

    await tester.tap(find.byType(DropdownButton<String>));
    await tester.pump();
    await tester.tap(find.text('Rating').last);
    await tester.pump();

    final titles = tester.widgetList<Text>(find.descendant(
      of: find.byType(SingleChildScrollView),
      matching: find.byType(Text),
    )).map((text) => text.data).whereType<String>().toList();

    expect(titles.indexOf('The Dark Knight'), lessThan(titles.indexOf('Pulp Fiction')));
  });
}
```

- [ ] **Step 2: Run tests to verify they fail**

Run:

```bash
flutter test test/responsive_movie_screen_test.dart
```

Expected: FAIL because these tests are not present yet.

- [ ] **Step 3: Add the tests to `test/responsive_movie_screen_test.dart`**

Merge the tests above into the existing test file.

- [ ] **Step 4: Run tests to verify they pass**

Run:

```bash
flutter test test/responsive_movie_screen_test.dart
```

Expected: PASS.

---

### Task 3: Add widget tests for responsive layout behavior

**Files:**
- Modify: `test/responsive_movie_screen_test.dart`

- [ ] **Step 1: Write failing tests**

Add these tests:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab6/main.dart';

void main() {
  testWidgets('uses a list layout on narrow screens', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: SizedBox(width: 600, child: GenreScreen())),
    );

    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(GridView), findsNothing);
  });

  testWidgets('uses a grid layout on wide screens', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: SizedBox(width: 900, child: GenreScreen())),
    );

    expect(find.byType(GridView), findsOneWidget);
    expect(find.byType(ListView), findsNothing);
  });
}
```

- [ ] **Step 2: Run tests to verify they fail**

Run:

```bash
flutter test test/responsive_movie_screen_test.dart
```

Expected: FAIL because these tests are not present yet.

- [ ] **Step 3: Add the tests to `test/responsive_movie_screen_test.dart`**

Merge the tests above into the existing test file.

- [ ] **Step 4: Run tests to verify they pass**

Run:

```bash
flutter test test/responsive_movie_screen_test.dart
```

Expected: PASS.

---

### Task 4: Run final verification

**Files:**
- `lib/main.dart`
- `test/responsive_movie_screen_test.dart`

- [ ] **Step 1: Run Flutter analyzer**

Run:

```bash
flutter analyze
```

Expected: No errors.

- [ ] **Step 2: Run all Flutter tests**

Run:

```bash
flutter test
```

Expected: All tests pass.

- [ ] **Step 3: Commit final verification-ready state**

Run:

```bash
git add lib/main.dart test/responsive_movie_screen_test.dart
git commit -m "test: verify responsive movie browser"
```

---
