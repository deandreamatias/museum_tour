import 'package:injectable/injectable.dart';

import '../app/locator.dart';
import '../models/exposition.dart';
import 'media_services.dart';

@lazySingleton
class TourService {
  final _mediaService = locator<MediaService>();

  List<Item> _items = [];
  int _index = -1;

  // TODO: Improve index indicator
  Item get item => _items[_index];
  int get indicator => _index + 1;
  int get lengthIndicator => _items.length;
  int get lengthItem => _items.length + 1;
  bool get lastItem => _index + 1 == _items.length;
  bool get firstItem => _index == 0;

  Future<void> getExpoItems() async {
    final Exposition _exposition = await _mediaService.getExpositionInfo();
    _items = _exposition.items;
  }

  void navigateExpo({bool continueExpo = true}) {
    if (continueExpo) {
      _index += 1;
    } else {
      _index -= 1;
    }
  }

  void jumpToExpo(int updateIndex) {
    _index = updateIndex;
  }
}
