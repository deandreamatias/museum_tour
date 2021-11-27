import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'splash_viewmodel.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.nonReactive(
      builder: (context, SplashViewModel model, child) => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      createNewModelOnInsert: true,
      onModelReady: (SplashViewModel model) => model.initPreferences(),
      viewModelBuilder: () => SplashViewModel(),
    );
  }
}
