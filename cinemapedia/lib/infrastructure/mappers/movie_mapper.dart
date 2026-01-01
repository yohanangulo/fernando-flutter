import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/models/movie_moviedb.dart';

class MovieMapper {
  static Movie movieDbToEntity(MovieMovieDb movie) => Movie(
    adult: movie.adult,
    backdropPath: movie.backdropPath.isNotEmpty
        ? 'https://image.tmdb.org/t/p/w500${movie.backdropPath}'
        : 'https://via.placeholder.com/500x750',
    genreIds: movie.genreIds.map((x) => x.toString()).toList(),
    id: movie.id,
    originalLanguage: movie.originalLanguage,
    originalTitle: movie.originalTitle,
    overview: movie.overview,
    popularity: movie.popularity,
    posterPath: movie.posterPath.isNotEmpty
        ? 'https://image.tmdb.org/t/p/w500${movie.posterPath}'
        : 'https://via.placeholder.com/500x750',
    releaseDate: movie.releaseDate,
    title: movie.title,
    video: movie.video,
    voteAverage: movie.voteAverage,
    voteCount: movie.voteCount,
  );
}
