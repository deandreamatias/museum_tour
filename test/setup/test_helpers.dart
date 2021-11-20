import 'package:mockito/mockito.dart';
import 'package:museum_tour/app/constants.dart';
import 'package:museum_tour/app/locator.dart';
import 'package:museum_tour/models/exposition.dart';
import 'package:museum_tour/models/time.dart';
import 'package:museum_tour/services/local_storage_service.dart';
import 'package:museum_tour/services/directory_service.dart';
import 'package:museum_tour/services/media_services.dart';
import 'package:museum_tour/services/settings_service.dart';
import 'package:museum_tour/services/time_service.dart';
import 'package:museum_tour/services/tour_service.dart';
import 'package:stacked_services/stacked_services.dart';

import 'test_constants.dart';

class NavigationServiceMock extends Mock implements NavigationService {}

class MediaServiceMock extends Mock implements MediaService {}

class TimeServiceMock extends Mock implements TimeService {
  List<Time> _listTime = <Time>[];
  Stopwatch _stopwatch = Stopwatch();

  Stopwatch get stopwatch => _stopwatch;
  List<Time> get listTime => _listTime;
}

class TourServiceMock extends Mock implements TourService {
  List<Item> _items = [];
  Item _favItem;

  List<Item> get items => _items;
  Item get favItem => _favItem;

  void getItems() {
    _items.addAll(List<Item>.generate(10, (index) => Item(id: index)));
  }

  void getTime() {
    _favItem = _items.singleWhere((item) => item.id == 1);
  }
}

class DirectoryServiceMock extends Mock implements DirectoryService {}

class HiveServiceMock extends Mock implements HiveService {
  HiveServiceMock(this.directoryRepository);

  final DirectoryService directoryRepository;
}

class SettingsServiceMock extends Mock implements SettingsService {}

NavigationService getAndRegisterNavigationServiceMock() {
  _removeRegistrationIfExists<NavigationService>();
  final service = NavigationServiceMock();
  locator.registerSingleton<NavigationService>(service);
  return service;
}

MediaService getAndRegisterMediaServiceMock() {
  _removeRegistrationIfExists<MediaService>();
  final service = MediaServiceMock();
  locator.registerSingleton<MediaService>(service);
  return service;
}

TimeService getAndRegisterTimeServiceMock() {
  _removeRegistrationIfExists<TimeService>();
  final service = TimeServiceMock();
  locator.registerSingleton<TimeService>(service);
  return service;
}

TourService getAndRegisterTourServiceMock() {
  _removeRegistrationIfExists<TourService>();
  final service = TourServiceMock();

  when(service.getExpoItems()).thenAnswer((realInvocation) {
    service.getItems();
    return Future.value();
  });
  when(service.finishExpo(getFavItem: true)).thenAnswer((realInvocation) {
    service.getTime();
    return true;
  });

  locator.registerSingleton<TourService>(service);
  return service;
}

DirectoryService getAndRegisterDirectoryServiceMock({
  bool hasError = false,
  bool staticPath = true,
}) {
  _removeRegistrationIfExists<DirectoryService>();
  final service = DirectoryServiceMock();

  if (hasError) {
    when(service.getPath()).thenThrow(
      UnimplementedError('Error to get path directory:'),
    );
  } else {
    when(service.getPath()).thenAnswer(
      (_) => Future<String>.value(
        staticPath
            ? TestConstants.PATH
            : '${TestConstants.PATH}/${DateTime.now().millisecondsSinceEpoch.toString()}',
      ),
    );
  }

  locator.registerSingleton<DirectoryService>(service);
  return service;
}

HiveService getAndRegisterHiveServiceMock({DirectoryService directory}) {
  _removeRegistrationIfExists<HiveService>();
  final service = HiveServiceMock(directory);
  locator.registerSingleton<HiveService>(service);
  return service;
}

SettingsService getAndRegisterSettingsServiceMock() {
  _removeRegistrationIfExists<SettingsService>();
  final service = SettingsServiceMock();
  locator.registerSingleton<SettingsService>(service);
  return service;
}

void registerServices() {
  getAndRegisterNavigationServiceMock();
  getAndRegisterMediaServiceMock();
  getAndRegisterTimeServiceMock();
  getAndRegisterTourServiceMock();
  getAndRegisterDirectoryServiceMock();
  getAndRegisterHiveServiceMock();
  getAndRegisterSettingsServiceMock();
}

void unregisterServices() {
  locator.unregister<MediaService>();
  locator.unregister<NavigationService>();
  locator.unregister<TimeService>();
  locator.unregister<TourService>();
  locator.unregister<DirectoryService>();
  locator.unregister<HiveService>();
  locator.unregister<SettingsService>();
}

void _removeRegistrationIfExists<T>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
