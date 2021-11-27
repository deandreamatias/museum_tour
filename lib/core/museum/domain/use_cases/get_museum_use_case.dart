import 'package:injectable/injectable.dart';
import '../models/museum.dart';

import '../repositories/i_museums_repository.dart';

@injectable
class GetMuseumUseCase {
  final IMuseumsRepository _museumsRepository;
  Museum? museum;

  GetMuseumUseCase(this._museumsRepository);

  Future<Museum?> call() async {
    museum ??= await _museumsRepository.getMuseum();
    return museum;
  }
}
