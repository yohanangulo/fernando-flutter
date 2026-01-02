import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final initialLoadingProvider = Provider<bool>((ref) {
  final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
  final popularMovies = ref.watch(popularMoviesProvider);
  final upcomingMovies = ref.watch(upcomingMoviesProvider);
  final topRatedMovies = ref.watch(topRatedMoviesProvider);

  return nowPlayingMovies.isNotEmpty &&
      popularMovies.isNotEmpty &&
      upcomingMovies.isNotEmpty &&
      topRatedMovies.isNotEmpty;
});
