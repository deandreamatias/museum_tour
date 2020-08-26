import 'package:museum_tour/app/locator.dart';
import 'package:museum_tour/app/router.gr.dart';
import 'package:museum_tour/services/database_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _hiveService = locator<HiveService>();

  Future<void> initPreferences() async {
    final bool started = await _hiveService.initPrefs();
    final bool configured = await _hiveService.configPrefs(box: 'preferences');
    if (started && configured) {
      await _navigationService.navigateTo(Routes.homeView);
    } else {
      throw 'Error to init and config preferences';
    }
  }
}
