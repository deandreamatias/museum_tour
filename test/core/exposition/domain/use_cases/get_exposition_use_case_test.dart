import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:museum_tour/core/exposition/domain/models/exposition.dart';
import 'package:museum_tour/core/exposition/domain/repositories/i_exposition_repository.dart';
import 'package:museum_tour/core/exposition/domain/use_cases/get_exposition_use_case.dart';

import 'get_exposition_use_case_test.mocks.dart';

@GenerateMocks([IExpositionRepository])
void main() {
  final repository = MockIExpositionRepository();
  final useCase = GetExpositionUseCase(repository);
  test('get exposition use case when call', () async {
    when(repository.getExposition()).thenAnswer(
      (_) async => Exposition(id: '', update: '', items: []),
    );

    final exposition = await useCase();

    expect(exposition, isA<Exposition>());
    expect(exposition.items.isEmpty, true);
    verify(repository.getExposition()).called(1);
  });
}
