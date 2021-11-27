import 'package:injectable/injectable.dart';

import '../../../../app/locator.dart';
import '../models/settings.dart';
import '../repositories/i_exposition_repository.dart';
import 'save_language_use_case.dart';

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
