import 'package:flutter_bloc_imdb_clone_app/data/mappers/movie_mapper.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/movie_data.dart';
import '../../domain/repositories/movie_repository.dart';
import '../remote/movie_api.dart';

@Singleton(as: MovieRepository)
class MovieRepositoryImpl implements MovieRepository {
  const MovieRepositoryImpl(this._movieApi);

  final MovieApi _movieApi;

  @override
  Future<List<MovieData>> getTrendingMoviesOfThisWeek() async {
    try {
      print('Fetching trending movies from API');
      final paginatedResponse = await _movieApi.getTrendingMoviesOfThisWeek();
      final movies = paginatedResponse.results;
      final data = movies.map((movie) => movie.toData()).toList();
      print('Fetched trending movies: $data');
      return data;
    } catch (error) {
      print('Error fetching trending movies: $error');
      rethrow;
    }
  }

  @override
  Future<List<MovieData>> getTopRatedMovies() async {
    try {
      print('Fetching top rated movies from API');
      final paginatedResponse = await _movieApi.getTopRatedMovies();
      final movies = paginatedResponse.results;
      final data = movies.map((movie) => movie.toData()).toList();
      print('Fetched top rated movies: $data');
      return data;
    } catch (error) {
      print('Error fetching top rated movies: $error');
      rethrow;
    }
  }
}
