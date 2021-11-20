import 'package:museum_tour/models/exposition.dart';
import 'package:museum_tour/services/tour_service.dart';
import 'package:stacked/stacked.dart';

import 'package:museum_tour/app/locator.dart';
import 'package:museum_tour/app/router.gr.dart';

import '../../../../main.dart';

class ExpositionTourViewModel extends BaseViewModel {
  final _tourService = locator<TourService>();

  Item get item => _tourService.getItem();

  Future navigateToHome() async {
    _tourService.finishExpo();
    await appRouter.push(HomeRoute());
  }

  Future continueExpo() async {
    if (_tourService.lastItem) {
      _tourService.finishExpo(getFavItem: true);
      await appRouter.push(FinishTourRoute());
    } else {
      setBusy(true);
      _tourService.navigateExpo();
      setBusy(false);
    }
  }

  void backExpo() async {
    if (_tourService.firstItem) {
      _tourService.finishExpo();
      appRouter.pop();
    } else {
      setBusy(true);
      _tourService.navigateExpo(continueExpo: false);
      setBusy(false);
    }
  }
}
