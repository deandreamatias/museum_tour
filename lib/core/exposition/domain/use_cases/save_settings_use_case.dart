import 'package:injectable/injectable.dart';
import 'package:museum_tour/app/locator.dart';
import 'package:museum_tour/core/exposition/domain/models/settings.dart';
import 'package:museum_tour/core/exposition/domain/use_cases/save_language_use_case.dart';

import '../repositories/i_exposition_repository.dart';

@injectable
class SaveSettingsUseCase {
  final IExpositionRepository _iExpositionRepository;

  SaveSettingsUseCase(this._iExpositionRepository);

  void call(Settings settings) async {
    final _saveLanguageUseCase = locator<SaveLanguageUseCase>();
    _saveLanguageUseCase(settings.language);
    _iExpositionRepository.saveName(settings.name);
    _iExpositionRepository.saveAutoplay(settings.autoplay);
  }
}
