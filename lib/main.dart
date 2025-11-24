import 'package:flutter/material.dart';

import 'core/router/routes.dart';
import 'core/theme/dark_theme.dart';
import 'core/theme/light_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'My Trainer App',
      themeMode: ThemeMode.light,
      theme: lightTheme,
      // darkTheme: darkTheme,

      routeInformationParser: AppRouter.route.routeInformationParser,
      routerDelegate: AppRouter.route.routerDelegate,
      routeInformationProvider: AppRouter.route.routeInformationProvider,
    );
  }
}
