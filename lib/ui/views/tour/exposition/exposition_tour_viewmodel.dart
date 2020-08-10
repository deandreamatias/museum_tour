import 'package:museum_tour/models/exposition.dart';
import 'package:museum_tour/services/tour_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:museum_tour/app/locator.dart';
import 'package:museum_tour/app/router.gr.dart';

class ExpositionTourViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _tourService = locator<TourService>();

  Item get item => _tourService.item;
  int get index => _tourService.index;
  int get lengthItem => _tourService.lengthItem;
  bool get lastItem => _tourService.lastItem;
  bool get firstItem => _tourService.firstItem;

  Future navigateToHome() async {
    await _navigationService.navigateTo(Routes.homeView);
  }

  Future continueExpo() async {
    if (lastItem) {
      await _navigationService.navigateTo(Routes.finishTourView);
    } else {
      setBusy(true);
      _tourService.navigateExpo();
      setBusy(false);
    }
  }

  void backExpo() async {
    if (firstItem) {
      _navigationService.back();
    } else {
      setBusy(true);
      _tourService.navigateExpo(continueExpo: false);
      setBusy(false);
    }
  }

  void jumpToExpo(int index) {
    setBusy(true);
    _tourService.jumpToExpo(index);
    setBusy(false);
  }

  Future getExpoItem() async {
    setBusy(true);
    await _tourService.getExpoItems();
    setBusy(false);
  }
}
