import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../app/locator.dart';
import '../../../app/router.gr.dart';
import '../../../models/museums.dart';
import '../../../services/media_services.dart';

class OtherMuseumsViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _mediaService = locator<MediaService>();

  Museums _museums;
  int _index = 0;

  int get index => _index;
  List<Museum> get museums => _museums.items;
  Museum get museumSelected => _museums.items[_index];

  Future<void> navigateToHome() async {
    await _navigationService.navigateTo(Routes.homeView);
  }

  Future<void> loadMuseumsInfo() async {
    setBusy(true);
    _museums = await _mediaService.getOtherMuseums();
    setBusy(false);
  }

  void setMuseum(int index) {
    setBusy(true);
    _index = index;
    setBusy(false);
  }

  Future<void> openLink({bool isWebsite = true}) async {
    if (_museums != null) {
      if (await canLaunch(_museums.items[_index].mapsLink)) {
        await launch(_museums.items[_index].mapsLink);
      } else {
        throw 'Map can\'t launch. Error to open the map';
      }
    } else {
      throw 'Empty museum info. Error to open map';
    }
  }
}
