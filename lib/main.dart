import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:imdb_localization/strings.g.dart';

import 'package:flutter_bloc_imdb_clone_app/app/imdb_clone_app.dart';
import 'package:flutter_bloc_imdb_clone_app/core/di/di_container.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await initDi();
  runApp(
    TranslationProvider(
      child: const ImdbCloneApp(),
    ),
  );
}