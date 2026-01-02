import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/movies_repository.dart';

class MovieRepositoryImpl implements MoviesRepository {
  MovieRepositoryImpl(this._moviedbDatasource);

  final MoviesDatasource _moviedbDatasource;

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return _moviedbDatasource.getNowPlaying(page: page);
  }
}
