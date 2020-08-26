import 'package:flutter/material.dart';
import 'package:museum_tour/app/constants.dart';
import 'package:museum_tour/ui/views/splash/splash_viewmodel.dart';
import 'package:stacked/stacked.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.nonReactive(
      builder: (context, SplashViewModel model, child) => Scaffold(
        backgroundColor: CustomColor.BACKGROUND,
        body: Center(child: CircularProgressIndicator()),
      ),
      createNewModelOnInsert: true,
      onModelReady: (SplashViewModel model) => model.initPreferences(),
      viewModelBuilder: () => SplashViewModel(),
    );
  }
}
