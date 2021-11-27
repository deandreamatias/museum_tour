import 'package:injectable/injectable.dart';

import '../models/languages.dart';
import '../repositories/i_exposition_repository.dart';

@injectable
class GetLanguagesUseCase {
  final IExpositionRepository _iExpositionRepository;

  GetLanguagesUseCase(this._iExpositionRepository);

  Future<Languages> call() async {
    return await _iExpositionRepository.getAvaliableLanguages();
  }
}
