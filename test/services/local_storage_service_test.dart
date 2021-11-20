import 'package:flutter_test/flutter_test.dart';
import 'package:museum_tour/services/local_storage_service.dart';
import 'package:museum_tour/services/directory_service.dart';

import '../setup/test_constants.dart';
import '../setup/test_helpers.dart';

void main() {
  group('Local storage service -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());
    test(
        'When constructed, service should be LocalStorageService and directoryRepository should be DirectoryService',
        () {
      final service = HiveService(PathProviderService());

      expect(service, isA<LocalStorageService>());
      expect(service.directoryRepository, isA<DirectoryService>());
    });
    group('init -', () {
      test('When called, return true', () async {
        final service =
            HiveService(getAndRegisterDirectoryServiceMock(staticPath: false));

        final result = await service.init();

        expect(result, true);
      });
      test('When called with error, return UnimplementdError', () async {
        final service =
            HiveService(getAndRegisterDirectoryServiceMock(staticPath: false));

        try {
          await service.init();
        } catch (e) {
          expect(e, isUnimplementedError);
        }
      });
    });
    group('config -', () {
      test('When called, return true', () async {
        final service =
            HiveService(getAndRegisterDirectoryServiceMock(staticPath: false));

        await service.init();

        final result = await service.config(box: TestConstants.BOX);

        expect(result, true);
      });
      test('When called with null box, return UnimplementdError', () async {
        final service =
            HiveService(getAndRegisterDirectoryServiceMock(staticPath: false));

        try {
          final result = await service.config(box: '');
          expect(result, false);
        } catch (e) {
          expect(e, isUnimplementedError);
        }
      });
    });
    group('getData -', () {
      test('When called, return null first time', () async {
        final service =
            HiveService(getAndRegisterDirectoryServiceMock(staticPath: false));

        await service.clearAllData();
        await service.init();
        await service.config(box: TestConstants.BOX);
        final result = service.getData<String>(TestConstants.TEST_KEY);

        expect(result, null);
      });
      test('When called with not empty data, return data', () async {
        final String test = DateTime.now().toIso8601String();
        final service =
            HiveService(getAndRegisterDirectoryServiceMock(staticPath: false));

        await service.clearAllData();
        await service.init();
        await service.config(box: TestConstants.BOX);
        await service.saveData<String>(TestConstants.TEST_KEY, test);
        final result = service.getData<String>(TestConstants.TEST_KEY) ?? '';

        expect(result.compareTo(test), 0);
      });
      test('When called with error, return UnimplementdError', () {
        final service =
            HiveService(getAndRegisterDirectoryServiceMock(staticPath: false));

        try {
          service.getData<String>(TestConstants.TEST_KEY);
        } catch (e) {
          expect(e, isUnimplementedError);
        }
      });
    });
    group('saveData -', () {
      test('When called with not empty data, return true', () async {
        final String test = DateTime.now().toIso8601String();
        final service =
            HiveService(getAndRegisterDirectoryServiceMock(staticPath: false));

        await service.clearAllData();
        await service.init();
        await service.config(box: TestConstants.BOX);
        final result =
            await service.saveData<String>(TestConstants.TEST_KEY, test);
        final result2 = service.getData<String>(TestConstants.TEST_KEY) ?? '';

        expect(result, true);
        expect(result2.compareTo(test), 0);
      });
      test('When called no local storage, return UnimplementdError', () async {
        final service =
            HiveService(getAndRegisterDirectoryServiceMock(staticPath: false));

        try {
          final result =
              await service.saveData<String>(TestConstants.TEST_KEY, 'test');

          expect(result, false);
        } catch (e) {
          expect(e, isUnimplementedError);
        }
      });
    });
    group('clearAllData -', () {
      test('When called, delete all open boxes from disk', () async {
        final service =
            HiveService(getAndRegisterDirectoryServiceMock(staticPath: false));

        await service.clearAllData();

        expect(service.canUseService, false);
      });
    });
  });
}
