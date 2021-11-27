import 'package:injectable/injectable.dart';

import '../models/museums.dart';
import '../repositories/i_museums_repository.dart';

@injectable
class GetMuseumsUseCase {
  final IMuseumsRepository _museumsRepository;
  Museums? museums;

  GetMuseumsUseCase(this._museumsRepository);

  Future<Museums> call() async {
    museums ??= await _museumsRepository.getMuseums();
    return museums ?? Museums(id: '', items: [], update: '');
  }
}
