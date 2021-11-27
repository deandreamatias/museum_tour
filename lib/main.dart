import 'package:flutter/material.dart';

import 'app/locator.dart';
import 'app/router.dart';
import 'app/theme.dart';

final appRouter = AppRouter();

void main() {
  setupLocator();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Museum tour',
      darkTheme: CustomTheme().availableThemes[1],
      theme: CustomTheme().availableThemes[0],
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
    );
  }
}
