// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/get_it_helper.dart';
import 'package:stacked_services/stacked_services.dart';

import '../services/directory_service.dart';
import '../services/local_storage_service.dart';
import '../services/media_services.dart';
import '../services/settings_service.dart';
import '../services/third_party_services_module.dart';
import '../services/time_service.dart';
import '../services/tour_service.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

void $initGetIt(GetIt g, {String environment}) {
  final gh = GetItHelper(g, environment);
  final thirdPartyServicesModule = _$ThirdPartyServicesModule();
  gh.lazySingleton<DialogService>(() => thirdPartyServicesModule.dialogService);
  gh.lazySingleton<DirectoryService>(() => PathProviderService());
  gh.lazySingleton<HiveService>(() => HiveService(g<DirectoryService>()));
  gh.lazySingleton<MediaService>(() => MediaService());
  gh.lazySingleton<NavigationService>(
      () => thirdPartyServicesModule.navigationService);
  gh.lazySingleton<SettingsService>(() => SettingsService());
  gh.lazySingleton<TimeService>(() => TimeService());
  gh.lazySingleton<TourService>(() => TourService());
}

class _$ThirdPartyServicesModule extends ThirdPartyServicesModule {
  @override
  DialogService get dialogService => DialogService();
  @override
  NavigationService get navigationService => NavigationService();
}
