import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loggy/loggy.dart';

import 'app/tools/bloc_observer.dart';
import 'app/my_app.dart';
import 'app/tools/paths/app_paths.dart';
import 'core/services/service_locator.dart' as di;

void main() async {
  //si assicura che tutto sia inizializzato a livello native
  WidgetsFlutterBinding.ensureInitialized();
  //iniziallizza il logger con la stampa a video colorata
  Loggy.initLoggy(
    logPrinter: const PrettyPrinter(),
  );
  //inizializza il path per la cache
  await AppPathProvider.initPath();

  di.init(); //init del service locator
  //observer di tutti i bloc
  Bloc.observer = AppBlocObserver();

  //fa partire la mia app
  runApp(const MyApp());
}
