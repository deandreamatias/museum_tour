import 'package:injectable/injectable.dart';

import '../models/languages.dart';
import '../repositories/i_exposition_repository.dart';

@injectable
class GetLanguagesUseCase {
  final IExpositionRepository _iExpositionRepository;

  GetLanguagesUseCase(this._iExpositionRepository);
  Languages languages = Languages();

  Future<Languages> call() async {
    if (languages.languages.isEmpty) {
      languages = await _iExpositionRepository.getAvaliableLanguages();
    }
    return languages;
  }
}
