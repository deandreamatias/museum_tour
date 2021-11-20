import 'package:injectable/injectable.dart';

import '../app/constants.dart';
import '../app/locator.dart';
import 'local_storage_service.dart';

@lazySingleton
class SettingsService {
  final _hiveService = locator<HiveService>();

  List<String> _languages = [];
  int _indexLanguage = 0;

  int get indexLanguage => _indexLanguage;
  List<String> get listLanguages => _languages;

  bool loadAutoplay() {
    return _hiveService.getData<bool>(DbKeys.AUTOPLAY_KEY) ?? false;
  }

  void setAutoplay(bool autoplay) {
    _hiveService.saveData<bool>(DbKeys.AUTOPLAY_KEY, autoplay);
  }

  String loadName() {
    return _hiveService.getData<String>(DbKeys.NAME_KEY) ?? '';
  }

  void setName({String name = 'Visitante'}) {
    _hiveService.saveData<String>(DbKeys.NAME_KEY, name);
  }

  void loadLanguages() {
    _languages = List<String>.generate(5, (index) => 'Language $index');
    final String? language = _hiveService.getData<String>(DbKeys.LANGUAGE_KEY);
    if (language != null) {
      _indexLanguage =
          _languages.indexWhere((element) => element.compareTo(language) == 0);
    } else {
      setLanguage(_indexLanguage);
    }
  }

  void setLanguage(int index) {
    _indexLanguage = index;
    _hiveService.saveData<String>(
        DbKeys.LANGUAGE_KEY, _languages[_indexLanguage]);
  }
}
