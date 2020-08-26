import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../models/exposition.dart';
import '../../../../services/tour_service.dart';
import '../../../../app/locator.dart';
import '../../../../app/router.gr.dart';

class FinishTourViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _tourService = locator<TourService>();

  Item get expoFavItem => _tourService.favItem;

  Future navigateToHome() async {
    await _navigationService.navigateTo(Routes.homeView);
  }
}
