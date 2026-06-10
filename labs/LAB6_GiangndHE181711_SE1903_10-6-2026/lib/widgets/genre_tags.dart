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
