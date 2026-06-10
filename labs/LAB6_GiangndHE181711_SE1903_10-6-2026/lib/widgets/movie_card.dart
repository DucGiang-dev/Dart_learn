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
