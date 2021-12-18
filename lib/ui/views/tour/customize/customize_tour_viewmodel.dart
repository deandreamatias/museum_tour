import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/locator.dart';
import '../../../../app/router.dart';
import '../../../../core/exposition/domain/models/languages.dart';
import '../../../../core/exposition/domain/models/settings.dart';
import '../../../../core/exposition/domain/services/tour_service.dart';
import '../../../../core/exposition/domain/use_cases/get_languages_use_case.dart';
import '../../../../core/exposition/domain/use_cases/get_settings_use_case.dart';
import '../../../../core/exposition/domain/use_cases/save_settings_use_case.dart';
import '../../../../main.dart';

class CustomizeTourViewModel extends BaseViewModel {
  final _getSettingsUseCase = locator<GetSettingsUseCase>();
  final _getLanguagesUseCase = locator<GetLanguagesUseCase>();
  final _saveSettingsUseCase = locator<SaveSettingsUseCase>();
  final _tourService = locator<TourService>();

  List<String> get listLanguages => _languages.languages;
  String get language => _language;
  String get name => _name;
  bool get autoplay => _autoplay;
  List<String> get textSizes => ['small', 'medium', 'big', 'extraBig'];
  TextEditingController get textEditingController => _textEditingController;

  Languages _languages = Languages();
  String _language = '';
  String _name = '';
  bool _autoplay = false;
  final TextEditingController _textEditingController =
      TextEditingController(text: '');

  Future navigateToHome() async {
    resetTour();
    await appRouter.push(const HomeRoute());
  }

  Future navigateToExpositionTour() async {
    _tourService.startTour();
    _saveSettingsUseCase(
      Settings(
        language: _language,
        autoplay: _autoplay,
        name: _textEditingController.text.isNotEmpty
            ? _textEditingController.text
            : '',
      ),
    );
    _textEditingController.clear();
    await appRouter.push(const ExpositionTourRoute());
  }

  Future<bool> resetTour() {
    _textEditingController.clear();
    return Future.value(_tourService.finishExpo());
  }

  void initialLoad() async {
    setBusy(true);
    _languages = await _getLanguagesUseCase();
    final settings = _getSettingsUseCase();
    _autoplay = settings.autoplay;
    _name = settings.name;
    _language = settings.language;
    setBusy(false);
  }
}
