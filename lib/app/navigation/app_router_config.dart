import 'package:flutter_bloc_imdb_clone_app/app/ui/screens/main/main_screen.dart';
import 'package:flutter_bloc_imdb_clone_app/app/ui/screens/main/main_screen_view_model.dart';
import 'package:flutter_bloc_imdb_clone_app/app/ui/screens/splash/splash_screen_view_model.dart';
import 'package:go_router/go_router.dart';

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
      builder: (context, state) => MainScreen(
        viewModel: MainScreenViewModel(),
      ),
    ),
  ];
}
