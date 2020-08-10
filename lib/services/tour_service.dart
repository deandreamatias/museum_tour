import 'package:injectable/injectable.dart';
import 'package:museum_tour/app/locator.dart';
import 'package:museum_tour/models/exposition.dart';

import 'media_services.dart';

@lazySingleton
class TourService {
  final _mediaService = locator<MediaService>();

  List<Item> _items = [];
  int _index = 1;

  Item get item => _items[_index];
  int get index => _index;
  int get lengthItem => _items.length;
  bool get lastItem => _index == _items.length;
  bool get firstItem => _index == 1;

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
    print(_items);
  }

  void jumpToExpo(int updateIndex) {
    _index = updateIndex;
  }
}
