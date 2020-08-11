import 'package:stacked/stacked.dart';

import '../../../app/locator.dart';
import '../../../services/tour_service.dart';

class ExpoIndicatorViewModel extends BaseViewModel {
  final _tourService = locator<TourService>();

  int get index => _tourService.indicator;
  int get lengthItem => _tourService.lengthItem;
  int get lengthIndicator => _tourService.lengthIndicator;

  void jumpToExpo(int updateIndex) {
    setBusy(true);
    _tourService.jumpToExpo(updateIndex);
    setBusy(false);
  }

  Future getExpoItem() async {
    setBusy(true);
    await _tourService.getExpoItems();
    setBusy(false);
  }
}
