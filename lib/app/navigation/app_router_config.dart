import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_imdb_clone_app/app/ui/screens/splash/splash_screen_view_model.dart';
import 'package:go_router/go_router.dart';

import '../../core/di/inject.dart';
import '../../domain/bloc/home_bloc/home_bloc.dart';
import '../ui/screens/main/main_screen.dart';
import '../ui/screens/main/main_screen_view_model.dart';
import '../ui/screens/splash/splash_screen.dart';
import 'app_route.dart';

class AppRouterConfig {
  late final GoRouter router = GoRouter(
    routes: _routes,
    initialLocation: AppRoute.root,
  );

  void dispose() {}

  late final List<RouteBase> _routes = <RouteBase>[
    GoRoute(
      path: '/',
      name: AppRoute.root,
      builder: (context, state) => SplashScreen(
        viewModel: SplashScreenViewModel(),
      ),
    ),
    GoRoute(
      path: '/main',
      name: AppRoute.main,
      builder: (_, __) => BlocProvider(
        create: (_) => HomeBloc(inject()),
        child: MainScreen(
          viewModel: MainScreenViewModel(),
        ),
      ),
    ),
  ];
}
