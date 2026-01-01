import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/movies_repository.dart';
import 'package:cinemapedia/infrastructure/datasources/moviedb_datasource.dart';

class MovieRepositoryImpl implements MoviesRepository {
  MovieRepositoryImpl(this._moviedbDatasource);

  final MoviedbDatasource _moviedbDatasource;

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return _moviedbDatasource.getNowPlaying(page: page);
  }
}
