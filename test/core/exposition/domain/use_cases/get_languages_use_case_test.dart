import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:museum_tour/core/exposition/domain/models/languages.dart';
import 'package:museum_tour/core/exposition/domain/repositories/i_exposition_repository.dart';
import 'package:museum_tour/core/exposition/domain/use_cases/get_languages_use_case.dart';

import 'get_languages_use_case_test.mocks.dart';

@GenerateMocks([IExpositionRepository])
void main() {
  setUp(() {
    reset(MockIExpositionRepository());
  });
  final repository = MockIExpositionRepository();
  final useCase = GetLanguagesUseCase(repository);
  test('get languages when call', () async {
    when(repository.getAvaliableLanguages())
        .thenAnswer((_) async => Languages());

    final languages = await useCase();

    expect(languages, isA<Languages>());
    verify(repository.getAvaliableLanguages()).called(1);
  });
  test('only get once when call twice', () async {
    when(repository.getAvaliableLanguages())
        .thenAnswer((_) async => Languages(languages: ['es']));

    final languages = await useCase();

    expect(languages.languages.length, 1);

    final languagesBis = await useCase();

    expect(languagesBis, equals(languages));
    verify(repository.getAvaliableLanguages()).called(1);
  });
}
