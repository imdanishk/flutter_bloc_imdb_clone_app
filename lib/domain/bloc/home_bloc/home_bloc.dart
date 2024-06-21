import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/movie_repository.dart';
import '../base_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends BaseBloc<HomeEvent, HomeState> {
  HomeBloc(this._movieRepository) : super(InitialHomeState()) {
    on<FetchTrendingMoviesHomeEvent>(_handleFetchTrendingMovies);
    on<FetchTopRatedMoviesHomeEvent>(_handleFetchTopRatedMovies);
  }

  final MovieRepository _movieRepository;

  Future<void> _handleFetchTrendingMovies(
    FetchTrendingMoviesHomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(FetchingTrendingMoviesHomeState());
    try {
      print('Fetching trending movies from repository');
      final data = await _movieRepository.getTrendingMoviesOfThisWeek();
      print('Trending movies data: $data');
      emit(FetchedTrendingMoviesHomeState(data));
    } catch (error) {
      print('Error in Bloc while fetching trending movies: $error');
      emit(FetchFailTrendingMoviesHomeState());
    }
  }

  Future<void> _handleFetchTopRatedMovies(
    FetchTopRatedMoviesHomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(FetchingTopRatedMoviesHomeState());
    try {
      print('Fetching top rated movies from repository');
      final data = await _movieRepository.getTopRatedMovies();
      print('Top rated movies data: $data');
      emit(FetchedTopRatedMoviesHomeState(data));
    } catch (error) {
      print('Error in Bloc while fetching top rated movies: $error');
      emit(FetchFailTopRatedMoviesHomeState());
    }
  }
}

