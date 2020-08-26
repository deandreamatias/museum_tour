import 'package:mockito/mockito.dart';
import 'package:museum_tour/app/locator.dart';
import 'package:museum_tour/models/exposition.dart';
import 'package:museum_tour/models/time.dart';
import 'package:museum_tour/services/media_services.dart';
import 'package:museum_tour/services/time_service.dart';
import 'package:museum_tour/services/tour_service.dart';
import 'package:stacked_services/stacked_services.dart';

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

void registerServices() {
  getAndRegisterNavigationServiceMock();
  getAndRegisterMediaServiceMock();
  getAndRegisterTimeServiceMock();
  getAndRegisterTourServiceMock();
}

void unregisterServices() {
  locator.unregister<MediaService>();
  locator.unregister<NavigationService>();
  locator.unregister<TimeService>();
  locator.unregister<TourService>();
}

void _removeRegistrationIfExists<T>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
