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
