import 'package:mockito/mockito.dart';
import 'package:museum_tour/app/locator.dart';
import 'package:museum_tour/services/media_services.dart';
import 'package:stacked_services/stacked_services.dart';

class NavigationServiceMock extends Mock implements NavigationService {}

class MediaServiceMock extends Mock implements MediaService {}

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

void registerServices() {
  getAndRegisterNavigationServiceMock();
  getAndRegisterMediaServiceMock();
}

void unregisterServices() {
  locator.unregister<MediaService>();
  locator.unregister<NavigationService>();
}

void _removeRegistrationIfExists<T>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
