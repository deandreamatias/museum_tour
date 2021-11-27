import 'package:stacked/stacked.dart';

import '../../../app/locator.dart';
import '../../../app/router.dart';
import '../../../core/exposition/domain/models/languages.dart';
import '../../../core/exposition/domain/use_cases/get_languages_use_case.dart';
import '../../../core/exposition/domain/use_cases/get_settings_use_case.dart';
import '../../../core/exposition/domain/use_cases/save_language_use_case.dart';
import '../../../main.dart';

class HomeViewModel extends BaseViewModel {
  final _getSettingsUseCase = locator<GetSettingsUseCase>();
  final _getLanguagesUseCase = locator<GetLanguagesUseCase>();
  final _saveLanguageUseCase = locator<SaveLanguageUseCase>();

  List<String> get listLanguages => _languages.languages;
  String get language => _language;

  Languages _languages = Languages();
  String _language = '';

  Future navigateToMuseumDetails() async {
    await appRouter.push(const MuseumDetailsRoute());
  }

  Future navigateToOtherMuseums() async {
    await appRouter.push(const OtherMuseumsRoute());
  }

  Future navigateToCustomizeTour() async {
    await appRouter.push(const CustomizeTourRoute());
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
