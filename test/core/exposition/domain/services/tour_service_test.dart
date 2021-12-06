import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:museum_tour/core/exposition/domain/models/exposition.dart';
import 'package:museum_tour/core/exposition/domain/models/exposition_item.dart';
import 'package:museum_tour/core/exposition/domain/models/time.dart';
import 'package:museum_tour/core/exposition/domain/services/time_service.dart';
import 'package:museum_tour/core/exposition/domain/services/tour_service.dart';
import 'package:museum_tour/core/exposition/domain/use_cases/get_exposition_use_case.dart';

import 'tour_service_test.mocks.dart';

@GenerateMocks([TimeService, GetExpositionUseCase])
void main() {
  final timeService = MockTimeService();
  final getExpositionUseCase = MockGetExpositionUseCase();
  final tourService = TourService(
    getExpositionUseCase: getExpositionUseCase,
    timeService: timeService,
  );

  final faker = Faker();
  Exposition _generateExposition({bool idIsIndex = false}) => Exposition(
        id: faker.randomGenerator.integer(9999).toString(),
        update: DateTime.now().toIso8601String(),
        items: List.generate(
          faker.randomGenerator.integer(20, min: 1),
          (index) => ExpositionItem(
            id: idIsIndex ? index : faker.randomGenerator.integer(9999),
            name: faker.randomGenerator.string(20),
            date: faker.date.dateTime().toIso8601String(),
            technique: faker.randomGenerator.string(20),
            locale: faker.randomGenerator.string(20),
            description: faker.lorem.sentences(2).join('\n'),
          ),
        ),
      );

  setUp(() {
    when(timeService.listTime).thenReturn([]);
    tourService.resetTour();
  });
  group('initial state -', () {
    test('indicator will be 0', () {
      expect(tourService.indicator, equals(0));
    });
    test('length of indicator list will be 0', () {
      expect(tourService.lengthIndicator, equals(0));
    });
    test('length of exposition items list will be 1', () {
      expect(tourService.lengthExpositionItems, equals(1));
    });
    test('dont will be the last item or first item', () {
      expect(tourService.isLastItem, false);
      expect(tourService.isFirstItem, false);
    });
    test('favItem will be null', () {
      expect(tourService.favItem, null);
    });
  });
  group('startTour -', () {
    test('indicator will be 1', () {
      tourService.startTour();

      expect(tourService.indicator, 1);
    });
    test('will be first item', () {
      tourService.startTour();

      expect(tourService.isFirstItem, true);
    });
  });
  group('getExpoItems -', () {
    test('get exposition items when call', () async {
      final exposition = _generateExposition();
      when(getExpositionUseCase()).thenAnswer((_) async => exposition);
      await tourService.getExpoItems();

      expect(tourService.lengthExpositionItems, exposition.items.length + 1);
    });
  });
  group('navigateExpo -', () {
    test('increase indicator when save the first time', () {
      tourService.navigateExpo();
      expect(tourService.indicator, 1);
    });
    test('indicator will be 2 when start tour and continue exposition', () {
      tourService.startTour();
      tourService.navigateExpo();

      expect(tourService.indicator, 2);
    });
    test('indicator will be 0 when start tour and return exposition', () {
      tourService.startTour();
      tourService.navigateExpo(continueExpo: false);

      expect(tourService.indicator, 0);
    });
  });
  group('jumpTpExpo -', () {
    test('indicator will be equal to new expo index', () async {
      final exposition = _generateExposition();
      when(getExpositionUseCase()).thenAnswer((_) async => exposition);
      await tourService.getExpoItems();

      tourService.jumpToExpo(5);

      expect(tourService.indicator, 5);
    });
    test('get assert error when newIndex is bigger than items length',
        () async {
      final exposition = _generateExposition();
      when(getExpositionUseCase()).thenAnswer((_) async => exposition);
      await tourService.getExpoItems();

      expect(
        () => tourService.jumpToExpo(tourService.lengthIndicator + 1),
        throwsA(isA<AssertionError>()),
      );
    });
  });
  group('finishExpo -', () {
    test('will reset values when call', () {
      final bool result = tourService.finishExpo();

      expect(tourService.indicator, 0);
      expect(tourService.lengthIndicator, 0);
      expect(result, true);
    });
    test('reset values when call after start tour', () async {
      final exposition = _generateExposition();
      when(getExpositionUseCase()).thenAnswer((_) async => exposition);
      await tourService.getExpoItems();
      tourService.startTour();

      final bool result = tourService.finishExpo();

      expect(tourService.indicator, 0);
      expect(tourService.lengthIndicator, 0);
      expect(result, true);
    });
    test('saveFav will be null when expo items list is empty', () async {
      final bool result = tourService.finishExpo(getFavItem: true);

      expect(tourService.favItem == null, true);
      expect(result, true);
    });
    test('will saveFav item when call', () async {
      final exposition = _generateExposition(idIsIndex: true);
      when(getExpositionUseCase()).thenAnswer((_) async => exposition);
      when(timeService.getHigherTime()).thenAnswer(
        (_) => Time(expoId: 5, elapsedMs: 500),
      );
      await tourService.getExpoItems();

      final bool result = tourService.finishExpo(getFavItem: true);

      expect(tourService.favItem != null, true);
      expect(tourService.favItem!.id, 5);
      expect(result, true);
    });
  });
  group('getItem -', () {
    test('get first item from list when when a single item in list', () async {
      when(getExpositionUseCase())
          .thenAnswer((_) async => _generateExposition(idIsIndex: true));
      await tourService.getExpoItems();
      tourService.startTour();

      final item = tourService.getItem();

      expect(item, isA<ExpositionItem>());
      expect(item.id, 0);
    });
    test('get error when has a empty item list', () async {
      expect(
        () => tourService.getItem(),
        throwsA(isA<UnimplementedError>()),
      );
    });
  });
}
