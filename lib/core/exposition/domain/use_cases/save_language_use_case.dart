import 'package:injectable/injectable.dart';

import '../repositories/i_exposition_repository.dart';

@injectable
class SaveLanguageUseCase {
  final IExpositionRepository _iExpositionRepository;

  SaveLanguageUseCase(this._iExpositionRepository);

  void call(String language) async {
    _iExpositionRepository.saveLanguage(language);
  }
}
