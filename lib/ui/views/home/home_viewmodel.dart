import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/router.gr.dart';
import '../../../app/locator.dart';
import '../../../services/database_service.dart';

class HomeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _hiveService = locator<HiveService>();

  List<String> _languages;
  int _index = 0;

  int get index => _index;
  List<String> get listLanguages => _languages;
  String get languageSelected => _languages[_index];

  Future navigateToMuseumDetails() async {
    await _navigationService.navigateTo(Routes.museumDetailsView);
  }

  Future navigateToOtherMuseums() async {
    await _navigationService.navigateTo(Routes.otherMuseumsView);
  }

  Future navigateToCustomizeTour() async {
    await _navigationService.navigateTo(Routes.customizeTourView);
  }

  Future<void> loadLanguages() async {
    setBusy(true);
    _languages = List<String>.generate(5, (index) => 'Language $index');
    final String language = _hiveService.getPrefs<String>('Languages');
    _index =
        _languages.indexWhere((element) => element.compareTo(language) == 0);
    setBusy(false);
  }

  void setLanguage(int index) {
    setBusy(true);
    _index = index;
    _hiveService.savePrefs<String>('Languages', _languages[_index]);
    setBusy(false);
  }
}
