import 'dart:convert';

import 'package:injectable/injectable.dart';

import '../../../../app/constants.dart';
import '../../../../app/locator.dart';
import '../../../../external/hive_service.dart';
import '../../../../external/media_service.dart';
import '../../domain/models/exposition.dart';
import '../../domain/repositories/i_exposition_repository.dart';
import '../models/exposition_model.dart';
import '../models/languages_model.dart';

@Injectable(as: IExpositionRepository)
class ExpositionRepository implements IExpositionRepository {
  final _mediaService = locator<MediaService>();
  final _hiveService = locator<HiveService>();

  @override
  Future<Exposition> getExposition() async {
    final result =
        await _mediaService.getJsonFromLocalFile(Assets.EXPOSITION_PATH);
    return ExpositionModel.fromJson(json.decode(result));
  }

  @override
  bool getAutoplay() {
    return _hiveService.getData<bool>(DbKeys.AUTOPLAY_KEY) ?? false;
  }

  @override
  String getLanguage() {
    return _hiveService.getData<String>(DbKeys.LANGUAGE_KEY) ?? '';
  }

  @override
  String getName() {
    return _hiveService.getData<String>(DbKeys.NAME_KEY) ?? '';
  }

  @override
  void saveAutoplay(bool autoplay) {
    _hiveService.saveData<bool>(DbKeys.AUTOPLAY_KEY, autoplay);
  }

  @override
  void saveLanguage(String langCode) {
    _hiveService.saveData<String>(DbKeys.LANGUAGE_KEY, langCode);
  }

  @override
  void saveName(String name) {
    _hiveService.saveData<String>(DbKeys.NAME_KEY, name);
  }

  @override
  Future<LanguagesModel> getAvaliableLanguages() async {
    final result =
        await _mediaService.getJsonFromLocalFile(Assets.LANGUAGES_PATH);
    return LanguagesModel.fromJson(json.decode(result));
  }
}
