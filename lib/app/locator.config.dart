// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:stacked_services/stacked_services.dart' as _i3;

import '../services/directory_service.dart' as _i4;
import '../services/local_storage_service.dart' as _i5;
import '../services/media_services.dart' as _i6;
import '../services/settings_service.dart' as _i7;
import '../services/third_party_services_module.dart' as _i10;
import '../services/time_service.dart' as _i8;
import '../services/tour_service.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final thirdPartyServicesModule = _$ThirdPartyServicesModule();
  gh.lazySingleton<_i3.DialogService>(
      () => thirdPartyServicesModule.dialogService);
  gh.lazySingleton<_i4.DirectoryService>(() => _i4.PathProviderService());
  gh.lazySingleton<_i5.HiveService>(
      () => _i5.HiveService(get<_i4.DirectoryService>()));
  gh.lazySingleton<_i6.MediaService>(() => _i6.MediaService());
  gh.lazySingleton<_i7.SettingsService>(() => _i7.SettingsService());
  gh.lazySingleton<_i8.TimeService>(() => _i8.TimeService());
  gh.lazySingleton<_i9.TourService>(() => _i9.TourService());
  return get;
}

class _$ThirdPartyServicesModule extends _i10.ThirdPartyServicesModule {
  @override
  _i3.DialogService get dialogService => _i3.DialogService();
}
