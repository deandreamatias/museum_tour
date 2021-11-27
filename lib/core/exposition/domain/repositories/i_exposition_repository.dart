import '../../data/models/languages_model.dart';
import '../models/exposition.dart';

abstract class IExpositionRepository {
  Future<Exposition> getExposition();
  bool getAutoplay();
  void saveAutoplay(bool autoplay);
  String getName();
  void saveName(String name);
  String getLanguage();
  Future<LanguagesModel> getAvaliableLanguages();
  void saveLanguage(String langCode);
}
