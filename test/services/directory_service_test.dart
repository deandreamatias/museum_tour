import 'package:flutter_test/flutter_test.dart';
import 'package:museum_tour/services/directory_service.dart';

import '../setup/test_constants.dart';
import '../setup/test_helpers.dart';

void main() {
  group('Path provider service -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());
    test('When constructed, PathProviderService should be DirectoryService',
        () {
      final service = PathProviderService();

      expect(service, isA<DirectoryService>());
    });
    group('getPath -', () {
      test('When called, return the PATH const string', () async {
        final service = getAndRegisterDirectoryServiceMock();

        final String path = await service.getPath();

        expect(path, TestConstants.PATH);
      });
      test('When fails, return error', () async {
        final service = getAndRegisterDirectoryServiceMock(hasError: true);

        try {
          await service.getPath();
          fail('should throw UnimplementedError');
        } catch (e) {
          expect(e, isUnimplementedError);
        }
      });
    });
  });
}
