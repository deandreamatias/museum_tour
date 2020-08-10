import 'package:flutter_test/flutter_test.dart';
import 'package:museum_tour/services/tour_service.dart';

import '../setup/test_helpers.dart';

void main() {
  group('Tour service -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());
    test('When constructed, index should be 1', () {
      final service = TourService();
      expect(service.index, 1);
    });
    group('navigateExpo -', () {
      test('When is called, index should be 2', () {
        final service = TourService();
        service.navigateExpo();
        expect(service.index, 2);
      });
      test('When is called with continueExpo = false, index should be 0', () {
        final service = TourService();
        service.navigateExpo(continueExpo: false);
        expect(service.index, 0);
      });
    });
    group('jumpToExpo -', () {
      test('When is called, index should be same that jumpToFront', () {
        final service = TourService();
        final int jumpToFront = 10;
        service.jumpToExpo(jumpToFront);
        expect(service.index, jumpToFront);
      });
      test('When is called, index should be same that jumpToBack', () {
        final service = TourService();
        final int jumpToFront = 10;
        final int jumpToBack = 5;
        service.jumpToExpo(jumpToFront);
        service.jumpToExpo(jumpToBack);
        expect(service.index, jumpToBack);
      });
    });
  });
}
