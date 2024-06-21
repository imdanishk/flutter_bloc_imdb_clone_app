import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../domain/bloc/home_bloc/home_bloc.dart';
import '../../../../../domain/bloc/home_bloc/home_event.dart';

class HomeScreenViewModel {
  void fetchTrendingMovies(BuildContext context) {
    context.read<HomeBloc>().add(FetchTrendingMoviesHomeEvent());
  }

  void fetchTopRatedMovies(BuildContext context) {
    context.read<HomeBloc>().add(FetchTopRatedMoviesHomeEvent());
  }
}
