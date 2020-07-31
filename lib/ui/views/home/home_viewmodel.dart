import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/router.gr.dart';
import '../../../app/locator.dart';

class HomeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  Future navigateToMuseumDetails() async {
    await _navigationService.navigateTo(Routes.museumDetailsView);
  }

  Future navigateToOtherMuseums() async {
    await _navigationService.navigateTo(Routes.otherMuseumsView);
  }
}
