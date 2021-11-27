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
        await _mediaService.getJsonFromLocalFile(Assets.expositionPath);
    return ExpositionModel.fromJson(json.decode(result));
  }

  @override
  bool getAutoplay() {
    return _hiveService.getData<bool>(DbKeys.autoplayKey) ?? false;
  }

  @override
  String getLanguage() {
    return _hiveService.getData<String>(DbKeys.languageKey) ?? '';
  }

  @override
  String getName() {
    return _hiveService.getData<String>(DbKeys.nameKey) ?? '';
  }

  @override
  void saveAutoplay(bool autoplay) {
    _hiveService.saveData<bool>(DbKeys.autoplayKey, autoplay);
  }

  @override
  void saveLanguage(String langCode) {
    _hiveService.saveData<String>(DbKeys.languageKey, langCode);
  }

  @override
  void saveName(String name) {
    _hiveService.saveData<String>(DbKeys.nameKey, name);
  }

  @override
  Future<LanguagesModel> getAvaliableLanguages() async {
    final result =
        await _mediaService.getJsonFromLocalFile(Assets.languagesPath);
    return LanguagesModel.fromJson(json.decode(result));
  }
}
