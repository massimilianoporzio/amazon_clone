import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loggy/loggy.dart';

import 'app/bloc_observer.dart';
import 'app/my_app.dart';
import 'core/services/service_locator.dart' as di;

void main() async {
  //si assicura che tutto sia inizializzato a livello native
  WidgetsFlutterBinding.ensureInitialized();
  //iniziallizza il logger con la stampa a video colorata
  Loggy.initLoggy(
    logPrinter: const PrettyPrinter(),
  );
  di.init(); //init del service locator
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}
