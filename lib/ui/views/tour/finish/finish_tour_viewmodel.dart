import 'package:stacked/stacked.dart';

import '../../../../main.dart';
import '../../../../models/exposition.dart';
import '../../../../services/tour_service.dart';
import '../../../../app/locator.dart';
import '../../../../app/router.gr.dart';

class FinishTourViewModel extends BaseViewModel {
  final _tourService = locator<TourService>();

  Item? get expoFavItem => _tourService.favItem;

  Future navigateToHome() async {
    await appRouter.push(HomeRoute());
  }
}
