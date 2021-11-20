import 'package:museum_tour/app/router.dart';
import 'package:museum_tour/main.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../app/locator.dart';
import '../../../models/museums.dart';
import '../../../services/media_services.dart';

class MuseumDetailsViewModel extends BaseViewModel {
  final _mediaService = locator<MediaService>();

  late Museum _museum;

  Museum get museum => _museum;
  String get museumContact => _museum.telephone + '\n' + _museum.email;

  Future<void> navigateToHome() async {
    await appRouter.push(HomeRoute());
  }

  Future<void> loadMuseumInfo() async {
    setBusy(true);
    _museum = await _mediaService.getMainMuseum();
    setBusy(false);
  }

  Future<void> openLink({bool isWebsite = true}) async {
    if (_museum != null) {
      if (await canLaunch(isWebsite ? _museum.websiteLink : _museum.mapsLink)) {
        await launch(isWebsite ? _museum.websiteLink : _museum.mapsLink);
      } else {
        throw 'Map can\'t launch. Error to open the map';
      }
    } else {
      throw 'Empty museum info. Error to open map';
    }
  }
}
