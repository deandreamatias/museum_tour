import 'package:injectable/injectable.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:museum_tour/app/constants.dart';

import 'package:museum_tour/models/exposition.dart';
import 'package:museum_tour/models/museums.dart';

@lazySingleton
class MediaService {
  /// Get exposition items from local file
  Future<Exposition> getExpositionInfo() async {
    final String _items = await rootBundle.loadString(Assets.EXPOSITION_PATH);
    return Exposition.fromRawJson(_items);
  }

  /// Get other museums info from local file
  Future<Museums> getOtherMuseums() async {
    final String _items = await rootBundle.loadString(Assets.MUSEUMS_PATH);
    return Museums.fromRawJson(_items);
  }

  /// Get museum of America info from local file
  Future<Museum> getMainMuseum() async {
    final String _items = await rootBundle.loadString(Assets.MAIN_MUSEUM_PATH);
    return Museum.fromRawJson(_items);
  }
}
