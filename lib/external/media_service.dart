import 'package:injectable/injectable.dart';
import 'package:flutter/services.dart' show rootBundle;

@lazySingleton
class MediaService {
  /// Get exposition items from local file
  Future<String> getJsonFromLocalFile(String path) async {
    return await rootBundle.loadString(path);
  }
}
