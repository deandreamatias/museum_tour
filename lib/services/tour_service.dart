import 'package:injectable/injectable.dart';

import '../app/locator.dart';
import '../models/exposition.dart';
import '../models/time.dart';
import 'media_services.dart';
import 'time_service.dart';

@lazySingleton
class TourService {
  final _mediaService = locator<MediaService>();
  final _timeService = locator<TimeService>();

  List<Item> _items = [];
  int _indicator = 0;
  Item _favItem;

  /// Actual indicator position
  int get indicator => _indicator;

  /// Indicator length
  int get lengthIndicator => _items.length;

  /// List item length
  int get lengthItem => _items.length + 1;

  /// First item of List items
  bool get lastItem => _indicator == _items.length;

  /// First item of List items
  bool get firstItem => _indicator == 1;

  /// Get fav item (with higher time spend)
  Item get favItem => _favItem;

  /// Get selected item from list items
  Item getItem() {
    if (_indicator > 0) {
      return _items[_indicator - 1];
    }
    throw 'Indicator is equal or lower than 0';
  }

  /// Start time and increment indicator to 1
  void startTour() {
    _timeService.startTime();
    _indicator += 1;
  }

  /// Get items list from database and start time counter.
  Future<void> getExpoItems() async {
    final Exposition _exposition = await _mediaService.getExpositionInfo();
    _items = _exposition.items;
  }

  /// By default, navigate to next expo item, save time and restart counter time
  /// If [continueExpo = false], return to previous expo item
  void navigateExpo({bool continueExpo = true}) {
    _timeService.saveTime(_indicator - 1,
        restartTime: true); // Remove indicator offset
    if (continueExpo) {
      _indicator += 1;
    } else {
      if (_indicator > 0) {
        _indicator -= 1;
      }
    }
  }

  /// Jump navigate to [updateIndex] expo item, save time and restart counter time
  void jumpToExpo(int updateIndex) {
    _indicator = updateIndex;
    _timeService.saveTime(
      _indicator - 1,
      restartTime: true,
    ); // Remove indicator offset
  }

  /// Finish tour and reset proprieties
  /// If [getFavItem = true], exposed expo item higher time
  bool finishExpo({bool getFavItem = false}) {
    _indicator = 0;
    if (getFavItem) _getFavExpoItem();
    _timeService.clearTime();
    return _timeService.listTime.isEmpty;
  }

  // Get expo item higher time from time service and save in [_favItem]
  void _getFavExpoItem() {
    final Time _time = _timeService.getHigherTime();
    _favItem = _items.singleWhere((item) => item.id == _time.expoId);
  }
}
