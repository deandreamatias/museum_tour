import 'package:museum_tour/app/router.dart';
import 'package:stacked/stacked.dart';

import '../../../app/constants.dart';
import '../../../app/locator.dart';
import '../../../main.dart';
import '../../../services/local_storage_service.dart';

class SplashViewModel extends BaseViewModel {
  final _hiveService = locator<HiveService>();

  Future<void> initPreferences() async {
    await _hiveService.init();
    await _hiveService.config(box: DbKeys.PREFS_BOX);
    if (_hiveService.canUseService) {
      await appRouter.push(HomeRoute());
    } else {
      throw 'Error to init and config preferences';
    }
  }
}
