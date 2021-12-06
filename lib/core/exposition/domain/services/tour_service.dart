import 'package:injectable/injectable.dart';

import '../models/exposition.dart';
import '../models/exposition_item.dart';
import '../models/time.dart';
import '../use_cases/get_exposition_use_case.dart';
import 'time_service.dart';

@lazySingleton
class TourService {
  TourService({
    required this.getExpositionUseCase,
    required this.timeService,
  });
  final GetExpositionUseCase getExpositionUseCase;
  final TimeService timeService;

  List<ExpositionItem> _items = [];
  int _indicator = 0;
  ExpositionItem? _favItem;

  /// Actual indicator position
  int get indicator => _indicator;

  /// Indicator length
  int get lengthIndicator => _items.length;

  /// List item length
  int get lengthExpositionItems => _items.length + 1;

  /// First item of List items
  bool get isLastItem => _indicator == _items.length && _items.isNotEmpty;

  /// First item of List items
  bool get isFirstItem => _indicator == 1;

  /// Get fav item (with higher time spend)
  ExpositionItem? get favItem => _favItem;

  /// Get selected item from list items
  ExpositionItem getItem() {
    if (_items.isNotEmpty && _indicator > 0) {
      return _items[_indicator - 1];
    }
    throw UnimplementedError('Indicator is equal or lower than 0');
  }

  /// Start time and increment indicator to 1
  void startTour() {
    timeService.startTime();
    _indicator += 1;
  }

  /// Get items list from database
  Future<void> getExpoItems() async {
    final Exposition _exposition = await getExpositionUseCase();
    _items = _exposition.items;
  }

  /// By default, navigate to next expo item, save time and restart counter time
  /// If [continueExpo = false], return to previous expo item
  void navigateExpo({bool continueExpo = true}) {
    _saveExpoTime();
    _updateIndicator(continueExpo: continueExpo);
  }

  /// Jump navigate to [updateIndex] expo item, save time and restart counter time
  void jumpToExpo(int updateIndex) {
    _updateIndicator(newIndex: updateIndex);
    _saveExpoTime();
  }

  /// Finish tour and reset proprieties
  /// If [getFavItem = true], exposed expo item higher time
  bool finishExpo({bool getFavItem = false}) {
    if (getFavItem) _getFavExpoItem();
    return resetTour();
  }

  // Get expo item higher time from time service and save in [_favItem]
  void _getFavExpoItem() {
    if (_items.isNotEmpty) {
      final Time _time = timeService.getHigherTime();
      _favItem = _items.singleWhere((item) => item.id == _time.expoId);
    }
  }

  bool resetTour() {
    _indicator = 0;
    _items.clear();
    timeService.clearTime();
    return timeService.listTime.isEmpty;
  }

  void _saveExpoTime() {
    timeService.saveTime(
      _indicator - 1,
      restartTime: true,
    );
  }

  void _updateIndicator({bool continueExpo = true, int? newIndex}) {
    assert(
      newIndex != null && newIndex >= 0 && newIndex <= lengthIndicator ||
          newIndex == null,
      'Error to use newIndex: $newIndex. LengthIndicator is: $lengthIndicator',
    );
    if (newIndex != null && newIndex >= 0 && newIndex <= lengthIndicator) {
      _indicator = newIndex;
      return;
    }
    if (continueExpo) {
      _indicator += 1;
    } else {
      if (_indicator > 0) {
        _indicator -= 1;
      }
    }
  }
}
