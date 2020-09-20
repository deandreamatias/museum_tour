import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/router.gr.dart';
import '../../../app/locator.dart';
import '../../../services/settings_service.dart';

class HomeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _settingsService = locator<SettingsService>();

  int get indexLanguage => _settingsService.indexLanguage;
  List<String> get listLanguages => _settingsService.listLanguages;

  Future navigateToMuseumDetails() async {
    await _navigationService.navigateTo(Routes.museumDetailsView);
  }

  Future navigateToOtherMuseums() async {
    await _navigationService.navigateTo(Routes.otherMuseumsView);
  }

  Future navigateToCustomizeTour() async {
    await _navigationService.navigateTo(Routes.customizeTourView);
  }

  void loadLanguages() {
    setBusy(true);
    _settingsService.loadLanguages();
    setBusy(false);
  }

  void setLanguage(int index) {
    setBusy(true);
    _settingsService.setLanguage(index);
    setBusy(false);
  }
}
