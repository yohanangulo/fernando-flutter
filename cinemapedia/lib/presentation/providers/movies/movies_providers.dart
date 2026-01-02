import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef GetMoviesCallback = Future<List<Movie>> Function(Ref ref, {int page});

class MoviesNotifier extends Notifier<List<Movie>> {
  MoviesNotifier({required this.fetchMoreMovies});

  final GetMoviesCallback fetchMoreMovies;

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

    final movies = await fetchMoreMovies(ref, page: currentPage);

    state = [...state, ...movies];

    await Future.delayed(const Duration(milliseconds: 300));

    isLoading = false;
  }
}

final nowPlayingMoviesProvider = NotifierProvider<MoviesNotifier, List<Movie>>(
  () => MoviesNotifier(
    fetchMoreMovies: (ref, {page = 1}) {
      return ref.watch(movieRepositoryProvider).getNowPlaying(page: page);
    },
  ),
);

final popularMoviesProvider = NotifierProvider<MoviesNotifier, List<Movie>>(
  () => MoviesNotifier(
    fetchMoreMovies: (ref, {page = 1}) {
      return ref.watch(movieRepositoryProvider).getPopular(page: page);
    },
  ),
);

final topRatedMoviesProvider = NotifierProvider<MoviesNotifier, List<Movie>>(
  () => MoviesNotifier(
    fetchMoreMovies: (ref, {page = 1}) {
      return ref.watch(movieRepositoryProvider).getTopRated(page: page);
    },
  ),
);

final upcomingMoviesProvider = NotifierProvider<MoviesNotifier, List<Movie>>(
  () => MoviesNotifier(
    fetchMoreMovies: (ref, {page = 1}) {
      return ref.watch(movieRepositoryProvider).getUpcoming(page: page);
    },
  ),
);
