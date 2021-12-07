import '../models/exposition.dart';
import '../models/languages.dart';

abstract class IExpositionRepository {
  Future<Exposition> getExposition();
  bool getAutoplay();
  void saveAutoplay(bool autoplay);
  String getName();
  void saveName(String name);
  String getLanguage();
  Future<Languages> getAvaliableLanguages();
  void saveLanguage(String langCode);
}
