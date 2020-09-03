import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/constants.dart';
import '../../../app/locator.dart';
import '../../../app/router.gr.dart';
import '../../../services/local_storage_service.dart';

class SplashViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _hiveService = locator<HiveService>();

  Future<void> initPreferences() async {
    await _hiveService.init();
    await _hiveService.config(box: DbKeys.PREFS_BOX);
    if (_hiveService.canUseService) {
      await _navigationService.navigateTo(Routes.homeView);
    } else {
      throw 'Error to init and config preferences';
    }
  }
}
