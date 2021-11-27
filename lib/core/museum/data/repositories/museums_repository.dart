import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:museum_tour/core/museum/data/models/museums_model.dart';

import '../../../../app/constants.dart';
import '../../../../app/locator.dart';
import '../../../../external/media_service.dart';
import '../../domain/models/museum.dart';
import '../../domain/models/museums.dart';
import '../../domain/repositories/i_museums_repository.dart';
import '../models/museum_model.dart';

@Injectable(as: IMuseumsRepository)
class MuseumsRepository implements IMuseumsRepository {
  final _mediaService = locator<MediaService>();

  @override
  Future<Museum> getMuseum() async {
    final result =
        await _mediaService.getJsonFromLocalFile(Assets.MAIN_MUSEUM_PATH);
    return MuseumModel.fromJson(json.decode(result));
  }

  @override
  Future<Museums> getMuseums() async {
    final result =
        await _mediaService.getJsonFromLocalFile(Assets.MUSEUMS_PATH);
    return MuseumsModel.fromJson(json.decode(result));
  }
}
