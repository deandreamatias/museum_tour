import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../models/time.dart';

@lazySingleton
class TimeService {
  final List<Time> _listTime = <Time>[];
  final Stopwatch _stopwatch = Stopwatch();

  @visibleForTesting
  Stopwatch get stopwatch => _stopwatch;

  /// List to save time from each item
  List<Time> get listTime => _listTime;

  /// Start time counter
  void startTime() {
    _stopwatch.start();
  }

  /// Save time with [expoId] in list and reset time counter.
  /// If [expoId] exist, will increase time to it.
  /// Required timer running to use this method.
  void saveTime(int expoId, {bool restartTime = false}) {
    if (_stopwatch.isRunning) {
      int _indexExpo = -1;

      if (_listTime.isNotEmpty) {
        _indexExpo = _listTime.indexWhere((item) => item.expoId == expoId);
        if (_indexExpo >= 0) {
          final Time _itemToUpdate = _listTime.elementAt(_indexExpo);
          _listTime.replaceRange(_indexExpo, _indexExpo + 1, [
            Time(
              expoId: expoId,
              elapsedMs:
                  _itemToUpdate.elapsedMs + _stopwatch.elapsedMilliseconds,
            )
          ]);
        }
      }

      if (_indexExpo == -1) {
        _listTime.add(
          Time(
            expoId: expoId,
            elapsedMs: _stopwatch.elapsedMilliseconds,
          ),
        );
      }
      _resetTime();
      if (restartTime) startTime();
    }
  }

  /// Clear list time and reset time counter
  void clearTime() {
    _listTime.clear();
    _resetTime();
  }

  /// Get higher time value in list time
  /// If list time is empty, throw a error
  Time getHigherTime() {
    if (_listTime.isNotEmpty) {
      _listTime.sort((a, b) => a.elapsedMs.compareTo(b.elapsedMs));
      return _listTime.last;
    } else {
      throw 'List time is empty';
    }
  }

  void _resetTime() {
    _stopwatch.stop();
    _stopwatch.reset();
  }
}
