import 'package:museum_tour/app/router.dart';
import 'package:stacked/stacked.dart';

import '../../../app/locator.dart';
import '../../../main.dart';
import '../../../services/settings_service.dart';

class HomeViewModel extends BaseViewModel {
  final _settingsService = locator<SettingsService>();

  int get indexLanguage => _settingsService.indexLanguage;
  List<String> get listLanguages => _settingsService.listLanguages;

  Future navigateToMuseumDetails() async {
    await appRouter.push(MuseumDetailsRoute());
  }

  Future navigateToOtherMuseums() async {
    await appRouter.push(OtherMuseumsRoute());
  }

  Future navigateToCustomizeTour() async {
    await appRouter.push(CustomizeTourRoute());
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
