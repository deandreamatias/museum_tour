import 'package:injectable/injectable.dart';
import 'package:museum_tour/core/museum/domain/models/museum.dart';

import '../repositories/i_museums_repository.dart';

@injectable
class GetMuseumUseCase {
  final IMuseumsRepository _museumsRepository;
  Museum? museum;

  GetMuseumUseCase(this._museumsRepository);

  Future<Museum?> call() async {
    if (museum == null) {
      museum = await _museumsRepository.getMuseum();
    }
    return museum;
  }
}
