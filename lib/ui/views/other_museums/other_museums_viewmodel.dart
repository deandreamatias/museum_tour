import 'package:museum_tour/app/router.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../app/locator.dart';
import '../../../main.dart';
import '../../../models/museums.dart';
import '../../../services/media_services.dart';

class OtherMuseumsViewModel extends BaseViewModel {
  final _mediaService = locator<MediaService>();

  late Museums _museums;
  int _index = 0;

  int get index => _index;
  List<Museum> get museums => _museums.items;
  Museum get museumSelected => _museums.items[_index];

  Future<void> navigateToHome() async {
    await appRouter.push(HomeRoute());
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
