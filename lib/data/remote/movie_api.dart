import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import 'responses/movie_response.dart';
import 'responses/paginated_response.dart';

part 'movie_api.g.dart';

@RestApi()
@singleton
abstract class MovieApi {
  @factoryMethod
  factory MovieApi(Dio dio) = _MovieApi;

  @GET('/trending/movie/week')
  Future<PaginatedResponse<MovieResponse>> getTrendingMoviesOfThisWeek();

  @GET('/movie/top_rated')
  Future<PaginatedResponse<MovieResponse>> getTopRatedMovies();
}
