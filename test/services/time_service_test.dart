import 'package:flutter_test/flutter_test.dart';
import 'package:museum_tour/models/time.dart';
import 'package:museum_tour/services/time_service.dart';

import '../setup/test_helpers.dart';

void main() {
  group('Tour service -', () {
    final int _correctId = 1;
    setUp(() => registerServices());
    tearDown(() => unregisterServices());
    test('When constructed, listTime should be List<Time> and empty', () {
      final service = TimeService();

      expect(service.listTime, isA<List<Time>>());
      expect(service.listTime.isEmpty, true);
    });
    test('When constructed, stopwatch elapsedTicks should be 0', () {
      final service = TimeService();

      expect(service.stopwatch.elapsedTicks, 0);
    });
    group('Stopwatch -', () {
      test('When start is called, stopwatch should being run', () {
        final service = TimeService();
        
        service.startTime();

        expect(service.stopwatch.isRunning, true);
      });
    });
    group('List time -', () {
      test('When save is called, list length should be 1', () {
        final service = TimeService();

        service.startTime();
        service.saveTime(1);

        expect(service.listTime.length, 1);
      });
      test('When save is called and exist id, will add time to it', () async {
        final service = TimeService();

        service.startTime();
        service.saveTime(_correctId, restartTime: true);
        await Future.delayed(Duration(milliseconds: 10));
        service.saveTime(_correctId);

        expect(service.listTime.first.time, greaterThanOrEqualTo(10));
      });
      test(
          'When clear is called, list should be empty',
          () {
        final service = TimeService();

        service.startTime();
        service.saveTime(_correctId);
        service.clearTime();

        expect(service.listTime.isEmpty, true);
      });
    });
    group('Higher time -', () {
      test(
          'When getHigherTime is called, higher time id should be the [_correctId]',
          () async {
        final service = TimeService();

        service.startTime();
        await Future.delayed(Duration(milliseconds: 10));
        service.saveTime(_correctId, restartTime: true);
        service.saveTime(_correctId + 1);
        final Time _time = service.getHigherTime();

        expect(_time.expoId, _correctId);
      });
    });
  });
}
