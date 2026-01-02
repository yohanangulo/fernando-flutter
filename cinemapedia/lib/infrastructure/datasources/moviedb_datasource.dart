import 'package:cinemapedia/config/env.dart';
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb_response.dart';
import 'package:dio/dio.dart';

class MoviedbDatasource extends MoviesDatasource {
  final _dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Env.apiKey,
        'language': 'es-MX',
      },
    ),
  );

  List<Movie> _jsonToMovies(Map<String, dynamic> json) {
    final moviedbResponse = MoviedbResponse.fromJson(json);
    final movies = moviedbResponse.results
        .map((x) => MovieMapper.movieDbToEntity(x))
        .toList();
    return movies;
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final res = await _dio.get(
      '/movie/now_playing',
      queryParameters: {'page': page},
    );

    return _jsonToMovies(res.data);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final res = await _dio.get(
      '/movie/popular',
      queryParameters: {'page': page},
    );

    return _jsonToMovies(res.data);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    final res = await _dio.get(
      '/movie/top_rated',
      queryParameters: {'page': page},
    );

    return _jsonToMovies(res.data);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
    final res = await _dio.get(
      '/movie/upcoming',
      queryParameters: {'page': page},
    );

    return _jsonToMovies(res.data);
  }
}
