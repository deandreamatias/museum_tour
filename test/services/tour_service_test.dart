import 'package:flutter_test/flutter_test.dart';
import 'package:museum_tour/services/tour_service.dart';

import '../setup/test_helpers.dart';

void main() {
  group('Tour service -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());
    test('When constructed, indicator should be 0', () {
      final service = TourService();

      expect(service.indicator, 0);
    });
    test('When constructed, lengthIndicator should be 0', () {
      final service = TourService();

      expect(service.lengthIndicator, 0);
    });
    test('When constructed, lengthItem should be 1', () {
      final service = TourService();

      expect(service.lengthItem, 1);
    });
    test('When constructed, lastItem should be true', () {
      final service = TourService();

      expect(service.lastItem, true);
    });
    test('When constructed, firstItem should be false', () {
      final service = TourService();

      expect(service.firstItem, false);
    });
    test('When constructed, favItem should be null', () {
      final service = TourService();

      expect(service.favItem, null);
    });
    group('navigateExpo -', () {
      test('When is called, indicator should be 1', () {
        final service = TourService();

        service.navigateExpo();

        expect(service.indicator, 1);
      });
      test('When is called with continueExpo = false, indicator should be 0',
          () {
        final service = TourService();

        service.navigateExpo(continueExpo: false);

        expect(service.indicator, 0);
      });
      test(
          'When is called with continueExpo = false and navigation before, indicator should be 0',
          () {
        final service = TourService();

        service.navigateExpo();
        service.navigateExpo(continueExpo: false);

        expect(service.indicator, 0);
      });
    });
    group('jumpToExpo -', () {
      final int jumpToFront = 10;
      final int jumpToBack = 5;
      test('When is called, index should be same that jumpToFront', () {
        final service = TourService();

        service.jumpToExpo(jumpToFront);

        expect(service.indicator, jumpToFront);
      });
      test('When is called, index should be same that jumpToBack', () {
        final service = TourService();

        service.jumpToExpo(jumpToFront);
        service.jumpToExpo(jumpToBack);

        expect(service.indicator, jumpToBack);
      });
    });
    group('startTour -', () {
      test('When is called, indicator should be 1', () {
        final service = TourService();

        service.startTour();

        expect(service.indicator, 1);
      });
    });

    group('finishExpo -', () {
      test(
          'When is called, indicator should be 0 and the result should be true ',
          () {
        final service = TourService();

        final bool _isFinishExpo = service.finishExpo();

        expect(service.indicator, 0);
        expect(_isFinishExpo, true);
      });
      test(
          'When is called with getFavItem = true, after navigate twice, favItem.id should be 2',
          () {
        final service = getAndRegisterTourServiceMock();

        service.getExpoItems();
        service.finishExpo(getFavItem: true);

        expect(service.favItem?.id, 1);
      });
    });
  });
}
