import 'package:museum_tour/app/constants.dart';
import 'package:museum_tour/app/locator.dart';
import 'package:museum_tour/app/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:url_launcher/url_launcher.dart';

class MuseumDetailsViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  Future<void> navigateToHome() async {
    await _navigationService.navigateTo(Routes.homeView);
  }

  Future<void> openMap() async {
    if (await canLaunch(Urls.LOCAL_MUSEUM)) {
      await launch(Urls.LOCAL_MUSEUM);
    } else {
      throw 'Could not open the map';
    }
  }
}
