import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/movies_repository.dart';

class MovieRepositoryImpl implements MoviesRepository {
  MovieRepositoryImpl(this._moviedbDatasource);

  final MoviesDatasource _moviedbDatasource;

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return _moviedbDatasource.getNowPlaying(page: page);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) {
    return _moviedbDatasource.getPopular(page: page);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) {
    return _moviedbDatasource.getTopRated(page: page);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) {
    return _moviedbDatasource.getUpcoming(page: page);
  }
}
