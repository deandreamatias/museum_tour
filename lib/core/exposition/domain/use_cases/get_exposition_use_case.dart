import 'package:injectable/injectable.dart';

import '../models/exposition.dart';
import '../repositories/i_exposition_repository.dart';

@injectable
class GetExpositionUseCase {
  final IExpositionRepository _iExpositionRepository;

  GetExpositionUseCase(this._iExpositionRepository);

  Future<Exposition> call() async {
    return await _iExpositionRepository.getExposition();
  }
}
