import '../../app/utils/app_utils.dart';
import '../../domain/entities/movie_data.dart';
import '../remote/responses/movie_response.dart';

extension MovieMapper on MovieResponse {
  MovieData toData() => MovieData(
        id: id,
        title: title,
        rating: voteAverage,
        posterUrl: AppUtils.addBaseImageUrl(posterPath),
      );
}
