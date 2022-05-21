import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie/environment_config.dart';
import 'package:movie/model/movie.dart';

import 'movies_exception.dart';

final movieServiceProvider = Provider<MovieService>((ref) {
  final config = ref.read(environmentConfigProvider);
  return MovieService(config, Dio());
});

class MovieService {
  MovieService(this._environmentConfig, this._dio);
  final EnvironmentConfig _environmentConfig;
  final Dio _dio;

  Future<List<Movie>> getMovies() async {
    try {
      final response = await _dio.get(
          "https://api.themoviedb.org/3/movie/popular?api_key=${_environmentConfig.movieApiKey}&language=en-US&page=1");

      final resalt = List<Map<String, dynamic>>.from(response.data["results"]);

      List<Movie> movies = resalt
          .map((movieData) => Movie.fromMap(movieData))
          .toList(growable: false);

      return movies;
    }on DioError catch (e) {
      throw MoviesException.fromDioError(e);
    }
  }
}
