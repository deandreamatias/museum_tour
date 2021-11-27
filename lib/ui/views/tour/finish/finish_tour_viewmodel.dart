import 'package:stacked/stacked.dart';

import '../../../../app/locator.dart';
import '../../../../app/router.gr.dart';
import '../../../../core/exposition/domain/models/exposition_item.dart';
import '../../../../core/exposition/domain/services/tour_service.dart';
import '../../../../main.dart';

class FinishTourViewModel extends BaseViewModel {
  final _tourService = locator<TourService>();

  ExpositionItem? get expoFavItem => _tourService.favItem;

  Future navigateToHome() async {
    await appRouter.push(const HomeRoute());
  }
}
