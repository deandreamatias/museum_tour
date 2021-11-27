import 'package:stacked/stacked.dart';

import '../../../app/locator.dart';
import '../../../core/exposition/domain/services/tour_service.dart';

class ExpoIndicatorViewModel extends BaseViewModel {
  final _tourService = locator<TourService>();

  int get indicator => _tourService.indicator;
  int get lengthItem => _tourService.lengthItem;
  int get lengthIndicator => _tourService.lengthIndicator;

  Future getExpoItem() async {
    setBusy(true);
    await _tourService.getExpoItems();
    setBusy(false);
  }
}
