import 'package:flutter_bloc_imdb_clone_app/core/di/di_container.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> initDi() async {
  print('Initializing Dependency Injection');
  await getIt.init();
  await getIt.allReady();
  print('Dependency Injection Initialized');
}