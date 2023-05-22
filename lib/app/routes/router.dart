import 'package:flutter/material.dart';

import '../../features/auth/presentation/pages/auth_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  Route<dynamic> route = switch (settings.name as String) {
    AuthScreen.routeName => MaterialPageRoute(
        settings: settings,
        builder: (context) => const AuthScreen(),
      ),
    _ => MaterialPageRoute(
        settings: settings,
        builder: (context) => const AuthScreen(),
      )
  };
  return route;
}
