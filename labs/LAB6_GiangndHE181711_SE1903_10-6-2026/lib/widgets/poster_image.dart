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
