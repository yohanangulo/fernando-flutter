import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class MovieHorizontalListView extends StatelessWidget {
  const MovieHorizontalListView({
    required this.movies,
    this.title,
    this.subtitle,
    this.loadNextPage,
    super.key,
  });

  final List<Movie> movies;
  final String? title;
  final String? subtitle;
  final VoidCallback? loadNextPage;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
