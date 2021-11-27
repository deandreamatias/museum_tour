import 'package:stacked/stacked.dart';

import '../../../app/constants.dart';
import '../../../app/locator.dart';
import '../../../app/router.dart';
import '../../../external/hive_service.dart';
import '../../../main.dart';

class SplashViewModel extends BaseViewModel {
  final _hiveService = locator<HiveService>();

  Future<void> initPreferences() async {
    await _hiveService.init();
    await _hiveService.config(box: DbKeys.prefsBox);
    if (_hiveService.canUseService) {
      await appRouter.push(const HomeRoute());
    } else {
      throw 'Error to init and config preferences';
    }
  }
}
