import 'package:flutter_test/flutter_test.dart';
import 'package:museum_tour/models/time.dart';
import 'package:museum_tour/services/time_service.dart';

import '../setup/test_helpers.dart';

void main() {
  group('Tour service -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());
    test('When constructed, listTime should be null', () {
      final service = TimeService();
      expect(service.listTime, null);
    });
    test('When constructed, stopwatch elapsedTicks should be 0', () {
      final service = TimeService();
      expect(service.stopwatch.elapsedTicks, 0);
    });
    group('Stopwatch -', () {
      test('When start is called, stopwatch should be different of 0', () {
        final service = TimeService();
        service.startStopwatch();
        expect(service.stopwatch.isRunning, true);
      });
      test('When reset is called, stopwatch should be 0', () {
        final service = TimeService();
        service.startStopwatch();
        service.cleanStopwatch();
        expect(service.stopwatch.elapsedTicks, 0);
      });
    });
    group('List -', () {
      test('When save is called, list length should be 1', () {
        final service = TimeService();
        service.saveTime(1);
        expect(service.listTime.length, 1);
      });
      test('When clean is called, list length should be 0', () {
        final service = TimeService();
        service.cleanListTime();
        expect(service.listTime.length, 0);
      });
    });
    group('Higher time -', () {
      test('When get is called, higher time id should be 1', () async {
        final service = TimeService();
        service.startStopwatch();
        service.saveTime(2);
        await Future.delayed(Duration(milliseconds: 10));
        service.saveTime(1);
        final Time _time = service.getHigherTime();
        expect(_time.expoId, 2);
      });
    });
  });
}
