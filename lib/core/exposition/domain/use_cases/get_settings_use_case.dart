import 'package:injectable/injectable.dart';

import '../models/settings.dart';
import '../repositories/i_exposition_repository.dart';

@injectable
class GetSettingsUseCase {
  final IExpositionRepository _iExpositionRepository;
  Settings? settings;

  GetSettingsUseCase(this._iExpositionRepository);

  Settings call() {
    if (settings == null) {
      late final language = _iExpositionRepository.getLanguage();
      final name = _iExpositionRepository.getName();
      final autoplay = _iExpositionRepository.getAutoplay();

      settings = Settings(
        language: language,
        autoplay: autoplay,
        name: name,
      );
    }
    return settings ?? Settings(language: '');
  }
}
