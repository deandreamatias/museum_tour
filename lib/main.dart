import 'package:flutter/material.dart';

import 'app/locator.dart';
import 'app/router.dart';

final appRouter = AppRouter();

void main() {
  setupLocator();
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Museum tour',
      theme: ThemeData(fontFamily: 'Quicksand'),
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
    );
  }
}
