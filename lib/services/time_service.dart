import 'package:injectable/injectable.dart';

import '../models/time.dart';

@lazySingleton
class TimeService {
  List<Time> listTime = [];
  Stopwatch stopwatch = Stopwatch();

  void startStopwatch() {
    stopwatch.start();
  }

  void cleanStopwatch() {
    stopwatch.stop();
    stopwatch.reset();
  }

  void saveTime(int expoId) {
    listTime
      ..add(Time(
        expoId: expoId,
        time: stopwatch.elapsedMilliseconds,
      ));
  }

  void cleanListTime() {
    listTime = [];
  }

  Time getHigherTime() {
    listTime.sort((a, b) => a.time.compareTo(b.time));
    return listTime.first;
  }
}
