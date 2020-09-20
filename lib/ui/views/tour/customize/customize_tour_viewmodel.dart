import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/locator.dart';
import '../../../../app/router.gr.dart';
import '../../../../services/settings_service.dart';
import '../../../../services/tour_service.dart';

class CustomizeTourViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _tourService = locator<TourService>();
  final _settingsService = locator<SettingsService>();

  String _name;
  bool _autoplay;
  TextEditingController _textEditingController =
      TextEditingController(text: '');

  int get indexLanguage => _settingsService.indexLanguage;
  List<String> get listLanguages => _settingsService.listLanguages;
  String get name => _name;
  bool get autoplay => _autoplay;
  TextEditingController get textEditingController => _textEditingController;

  Future navigateToHome() async {
    resetTour();
    await _navigationService.navigateTo(Routes.homeView);
  }

  Future navigateToExpositionTour() async {
    _tourService.startTour();
    _setName();
    _textEditingController.clear();
    await _navigationService.navigateTo(Routes.expositionTourView);
  }

  Future<bool> resetTour() {
    _textEditingController.clear();
    return Future.value(_tourService.finishExpo());
  }

  void loadSettings() {
    setBusy(true);
    _settingsService.loadLanguages();
    _name = _settingsService.loadName();
    _autoplay = _settingsService.loadAutoplay();
    setBusy(false);
  }

  void setLanguage(int index) {
    setBusy(true);
    _settingsService.setLanguage(index);
    setBusy(false);
  }

  void setAutoplay(bool autoplay) {
    setBusy(true);
    _settingsService.setAutoplay(autoplay);
    setBusy(false);
  }

  void _setName() {
    setBusy(true);
    _textEditingController.text.isNotEmpty
        ? _settingsService.setName(name: _textEditingController.text)
        : _settingsService.setName();
    setBusy(false);
  }
}
