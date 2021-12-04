import 'package:flutter_test/flutter_test.dart';
import 'package:museum_tour/core/exposition/domain/services/time_service.dart';

void main() {
  final timeService = TimeService();
  group('startTime - ', () {
    test('stopwatch will be running when call', () {
      timeService.startTime();

      expect(timeService.stopwatch.isRunning, true);
    });
    test('stopwatch will load 10 ms when wait 10ms', () async {
      timeService.startTime();
      await Future.delayed(const Duration(milliseconds: 10));

      expect(
          timeService.stopwatch.elapsedMilliseconds, greaterThanOrEqualTo(10));
    });
  });
  group('clearTime - ', () {
    test('stopwatch will be reset and listTime clear when call', () {
      timeService.clearTime();

      expect(timeService.stopwatch.isRunning, false);
      expect(timeService.stopwatch.elapsedTicks, 0);
      expect(timeService.listTime.isEmpty, true);
    });
    test('stopwatch will be reset and listTime clear when call after startTime',
        () async {
      timeService.startTime();
      await Future.delayed(const Duration(milliseconds: 10));
      timeService.clearTime();

      expect(timeService.stopwatch.isRunning, false);
      expect(timeService.stopwatch.elapsedTicks, 0);
      expect(timeService.listTime.isEmpty, true);
    });
  });
  group('saveTime - ', () {
    test('dont do nothing when stopwatch miliseconds is 0', () {
      timeService.saveTime(0);

      expect(timeService.listTime.isEmpty, true);
      expect(timeService.stopwatch.elapsedTicks, 0);
    });
    test('add time when call with started stopwatch', () async {
      timeService.startTime();
      await Future.delayed(const Duration(milliseconds: 10));
      timeService.saveTime(0);

      expect(timeService.listTime.length, 1);
      expect(timeService.listTime.first.expoId, 0);
      expect(timeService.listTime.first.elapsedMs, greaterThanOrEqualTo(10));
      expect(timeService.stopwatch.isRunning, false);
      expect(timeService.stopwatch.elapsedTicks, 0);
    });
    test('add time and restart stopwatch when call with restartTime true',
        () async {
      timeService.startTime();
      await Future.delayed(const Duration(milliseconds: 10));
      timeService.saveTime(0, restartTime: true);

      expect(timeService.listTime.length, 1);
      expect(timeService.listTime.first.expoId, 0);
      expect(timeService.listTime.first.elapsedMs, greaterThanOrEqualTo(10));
      expect(timeService.stopwatch.isRunning, true);
      expect(timeService.stopwatch.elapsedTicks, greaterThan(0));
    });
    test('replace time when exist previous time', () async {
      timeService.startTime();
      await Future.delayed(const Duration(milliseconds: 10));
      timeService.saveTime(0, restartTime: true);
      await Future.delayed(const Duration(milliseconds: 10));
      timeService.saveTime(0);

      expect(timeService.listTime.length, 1);
      expect(timeService.listTime.first.expoId, 0);
      expect(timeService.listTime.first.elapsedMs, greaterThanOrEqualTo(20));
      expect(timeService.stopwatch.isRunning, false);
      expect(timeService.stopwatch.elapsedTicks, 0);
    });
    test('add 10 times when call 10 times', () async {
      timeService.startTime();
      for (var i = 0; i < 10; i++) {
        await Future.delayed(const Duration(milliseconds: 10));
        timeService.saveTime(i, restartTime: i < 9);
      }

      expect(timeService.listTime.length, 10);
      expect(timeService.listTime.first.expoId, 0);
      expect(timeService.listTime.first.elapsedMs, greaterThanOrEqualTo(20));
      expect(timeService.stopwatch.isRunning, false);
      expect(timeService.stopwatch.elapsedTicks, 0);
    });
  });
}
