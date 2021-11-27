// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/exposition/data/repositories/exposition_repository.dart' as _i6;
import '../core/exposition/domain/repositories/i_exposition_repository.dart'
    as _i5;
import '../core/exposition/domain/services/time_service.dart' as _i12;
import '../core/exposition/domain/services/tour_service.dart' as _i13;
import '../core/exposition/domain/use_cases/get_exposition_use_case.dart'
    as _i14;
import '../core/exposition/domain/use_cases/get_languages_use_case.dart'
    as _i15;
import '../core/exposition/domain/use_cases/get_settings_use_case.dart' as _i18;
import '../core/exposition/domain/use_cases/save_language_use_case.dart'
    as _i10;
import '../core/exposition/domain/use_cases/save_settings_use_case.dart'
    as _i11;
import '../core/museum/data/repositories/museums_repository.dart' as _i8;
import '../core/museum/domain/repositories/i_museums_repository.dart' as _i7;
import '../core/museum/domain/use_cases/get_museum_use_case.dart' as _i16;
import '../core/museum/domain/use_cases/get_museums_use_case.dart' as _i17;
import '../external/directory_service.dart' as _i3;
import '../external/hive_service.dart' as _i4;
import '../external/media_service.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.DirectoryService>(() => _i3.PathProviderService());
  gh.lazySingleton<_i4.HiveService>(
      () => _i4.HiveService(get<_i3.DirectoryService>()));
  gh.factory<_i5.IExpositionRepository>(() => _i6.ExpositionRepository());
  gh.factory<_i7.IMuseumsRepository>(() => _i8.MuseumsRepository());
  gh.lazySingleton<_i9.MediaService>(() => _i9.MediaService());
  gh.factory<_i10.SaveLanguageUseCase>(
      () => _i10.SaveLanguageUseCase(get<_i5.IExpositionRepository>()));
  gh.factory<_i11.SaveSettingsUseCase>(
      () => _i11.SaveSettingsUseCase(get<_i5.IExpositionRepository>()));
  gh.lazySingleton<_i12.TimeService>(() => _i12.TimeService());
  gh.lazySingleton<_i13.TourService>(() => _i13.TourService());
  gh.factory<_i14.GetExpositionUseCase>(
      () => _i14.GetExpositionUseCase(get<_i5.IExpositionRepository>()));
  gh.factory<_i15.GetLanguagesUseCase>(
      () => _i15.GetLanguagesUseCase(get<_i5.IExpositionRepository>()));
  gh.factory<_i16.GetMuseumUseCase>(
      () => _i16.GetMuseumUseCase(get<_i7.IMuseumsRepository>()));
  gh.factory<_i17.GetMuseumsUseCase>(
      () => _i17.GetMuseumsUseCase(get<_i7.IMuseumsRepository>()));
  gh.factory<_i18.GetSettingsUseCase>(
      () => _i18.GetSettingsUseCase(get<_i5.IExpositionRepository>()));
  return get;
}
