import 'package:museum_tour/app/router.dart';
import 'package:museum_tour/core/exposition/domain/models/languages.dart';
import 'package:museum_tour/core/exposition/domain/use_cases/get_languages_use_case.dart';
import 'package:museum_tour/core/exposition/domain/use_cases/get_settings_use_case.dart';
import 'package:museum_tour/core/exposition/domain/use_cases/save_language_use_case.dart';
import 'package:stacked/stacked.dart';

import '../../../app/locator.dart';
import '../../../main.dart';

class HomeViewModel extends BaseViewModel {
  final _getSettingsUseCase = locator<GetSettingsUseCase>();
  final _getLanguagesUseCase = locator<GetLanguagesUseCase>();
  final _saveLanguageUseCase = locator<SaveLanguageUseCase>();

  List<String> get listLanguages => _languages.languages;
  String get language => _language;

  late Languages _languages;
  String _language = '';

  Future navigateToMuseumDetails() async {
    await appRouter.push(MuseumDetailsRoute());
  }

  Future navigateToOtherMuseums() async {
    await appRouter.push(OtherMuseumsRoute());
  }

  Future navigateToCustomizeTour() async {
    await appRouter.push(CustomizeTourRoute());
  }

  void initialLoad() async {
    setBusy(true);
    _languages = await _getLanguagesUseCase();
    final settings = _getSettingsUseCase();
    _language = settings.language;
    setBusy(false);
  }

  void saveLanguage(String language) {
    setBusy(true);
    _saveLanguageUseCase(language);
    setBusy(false);
  }
}
