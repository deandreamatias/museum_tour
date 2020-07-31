import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:museum_tour/app/locator.dart';
import 'package:museum_tour/app/router.gr.dart';

class CustomizeTourViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  Future navigateToHome() async {
    await _navigationService.navigateTo(Routes.homeView);
  }

  Future navigateToExpositionTour() async {
    await _navigationService.navigateTo(Routes.expositionTourView);
  }
}
