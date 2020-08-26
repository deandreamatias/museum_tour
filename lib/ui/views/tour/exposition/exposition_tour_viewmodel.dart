import 'package:museum_tour/models/exposition.dart';
import 'package:museum_tour/services/tour_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:museum_tour/app/locator.dart';
import 'package:museum_tour/app/router.gr.dart';

class ExpositionTourViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _tourService = locator<TourService>();

  Item get item => _tourService.getItem();

  Future navigateToHome() async {
    _tourService.finishExpo();
    await _navigationService.navigateTo(Routes.homeView);
  }

  Future continueExpo() async {
    if (_tourService.lastItem) {
      _tourService.finishExpo(getFavItem: true);
      await _navigationService.navigateTo(Routes.finishTourView);
    } else {
      setBusy(true);
      _tourService.navigateExpo();
      setBusy(false);
    }
  }

  void backExpo() async {
    if (_tourService.firstItem) {
      _tourService.finishExpo();
      _navigationService.back();
    } else {
      setBusy(true);
      _tourService.navigateExpo(continueExpo: false);
      setBusy(false);
    }
  }
}
