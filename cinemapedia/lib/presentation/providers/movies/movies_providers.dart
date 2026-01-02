import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoviesNotifier extends Notifier<List<Movie>> {
  int currentPage = 0;
  bool isLoading = false;

  @override
  List<Movie> build() {
    return [];
  }

  Future<void> loadNextPage() async {
    if (isLoading) return;

    isLoading = true;

    currentPage++;
    final movies = await ref
        .watch(movieRepositoryProvider)
        .getNowPlaying(page: currentPage);

    state = [...state, ...movies];

    await Future.delayed(const Duration(milliseconds: 300));

    isLoading = false;
  }
}

final nowPlayingMoviesProvider = NotifierProvider<MoviesNotifier, List<Movie>>(
  MoviesNotifier.new,
);
