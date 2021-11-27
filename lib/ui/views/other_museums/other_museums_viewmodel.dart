import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../app/locator.dart';
import '../../../app/router.dart';
import '../../../core/museum/domain/models/museum.dart';
import '../../../core/museum/domain/models/museums.dart';
import '../../../core/museum/domain/use_cases/get_museums_use_case.dart';
import '../../../main.dart';

class OtherMuseumsViewModel extends BaseViewModel {
  final _getMuseumsUseCase = locator<GetMuseumsUseCase>();

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
    _museums = await _getMuseumsUseCase();
    setBusy(false);
  }

  void setMuseum(int index) {
    setBusy(true);
    _index = index;
    setBusy(false);
  }

  Future<void> openLink({bool isWebsite = true}) async {
    if (await canLaunch(_museums.items[_index].mapsLink)) {
      await launch(_museums.items[_index].mapsLink);
    } else {
      throw 'Map can\'t launch. Error to open the map';
    }
  }
}
