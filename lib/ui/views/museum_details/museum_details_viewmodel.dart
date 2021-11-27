import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../app/locator.dart';
import '../../../app/router.dart';
import '../../../core/museum/domain/models/museum.dart';
import '../../../core/museum/domain/use_cases/get_museum_use_case.dart';
import '../../../main.dart';

class MuseumDetailsViewModel extends BaseViewModel {
  final _getMuseumUseCase = locator<GetMuseumUseCase>();

  Museum? _museum;

  Museum? get museum => _museum;
  String get museumContact =>
      _museum?.telephone ?? '' + '\n' + (_museum?.email ?? '');

  Future<void> navigateToHome() async {
    await appRouter.push(HomeRoute());
  }

  Future<void> loadMuseumInfo() async {
    setBusy(true);
    _museum = await _getMuseumUseCase();
    setBusy(false);
  }

  Future<void> openLink({bool isWebsite = true}) async {
    if (_museum != null) {
      if (await canLaunch(
          isWebsite ? _museum!.websiteLink : _museum!.mapsLink)) {
        await launch(isWebsite ? _museum!.websiteLink : _museum!.mapsLink);
      } else {
        throw 'Map can\'t launch. Error to open the map';
      }
    } else {
      throw 'Empty museum info. Error to open map';
    }
  }
}
