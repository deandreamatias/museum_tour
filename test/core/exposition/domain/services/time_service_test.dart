import 'package:flutter_test/flutter_test.dart';
import 'package:museum_tour/core/exposition/domain/services/time_service.dart';

void main() {
  final timeService = TimeService();

  setUp(() {
    timeService.clearTime();
  });
  group('initial state -', () {
    test('stopwatch will be stoped and elapsed 0', () {
      expect(timeService.stopwatch.isRunning, false);
      expect(timeService.stopwatch.elapsedMilliseconds, 0);
    });
    test('list will be empty', () {
      expect(timeService.listTime.isEmpty, true);
    });
  });
  group('startTime -', () {
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
  group('clearTime -', () {
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
  group('saveTime -', () {
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
      await Future.delayed(const Duration(milliseconds: 50));
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
      expect(timeService.listTime.first.elapsedMs, greaterThanOrEqualTo(10));
      expect(timeService.stopwatch.isRunning, false);
      expect(timeService.stopwatch.elapsedTicks, 0);
    });
  });
  group('getHigherTime -', () {
    test('get single time from list when has a list with single item',
        () async {
      timeService.startTime();
      await Future.delayed(const Duration(milliseconds: 10));
      timeService.saveTime(0);

      final time = timeService.getHigherTime();

      expect(time.expoId, 0);
      expect(time.elapsedMs, greaterThanOrEqualTo(10));
    });
    test('get higher time from list when has a list with 10 items', () async {
      timeService.startTime();
      for (var i = 0; i < 10; i++) {
        await Future.delayed(Duration(milliseconds: i == 5 ? 50 : 10));
        timeService.saveTime(i, restartTime: i < 9);
      }

      final time = timeService.getHigherTime();

      expect(time.expoId, 5);
      expect(time.elapsedMs, greaterThanOrEqualTo(50));
    });
    test('get error when has a empty list', () async {
      expect(
        () => timeService.getHigherTime(),
        throwsA(isA<UnimplementedError>()),
      );
    });
  });
}
