import 'package:stacked/stacked.dart';

import '../../../../app/locator.dart';
import '../../../../app/router.gr.dart';
import '../../../../core/exposition/domain/models/exposition_item.dart';
import '../../../../core/exposition/domain/services/tour_service.dart';
import '../../../../main.dart';

class ExpositionTourViewModel extends BaseViewModel {
  final _tourService = locator<TourService>();

  ExpositionItem get item => _tourService.getItem();

  Future navigateToHome() async {
    _tourService.finishExpo();
    await appRouter.push(const HomeRoute());
  }

  Future continueExpo() async {
    if (_tourService.isLastItem) {
      _tourService.finishExpo(getFavItem: true);
      await appRouter.push(const FinishTourRoute());
    } else {
      setBusy(true);
      _tourService.navigateExpo();
      setBusy(false);
    }
  }

  void backExpo() async {
    if (_tourService.isFirstItem) {
      _tourService.finishExpo();
      appRouter.pop();
    } else {
      setBusy(true);
      _tourService.navigateExpo(continueExpo: false);
      setBusy(false);
    }
  }
}
