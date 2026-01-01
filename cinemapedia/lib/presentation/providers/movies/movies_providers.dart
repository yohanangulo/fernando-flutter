import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoviesNotifier extends Notifier<List<Movie>> {
  int currentPage = 0;

  @override
  List<Movie> build() {
    return [];
  }

  Future<void> loadNextPage() async {
    currentPage++;
    final movies = await ref.watch(movieRepositoryProvider).getNowPlaying();
    state = [...state, ...movies];
  }
}

final nowPlayingMoviesProvider = NotifierProvider<MoviesNotifier, List<Movie>>(
  MoviesNotifier.new,
);
