import 'package:auto_route/auto_route.dart';

import '../ui/views/home/home_view.dart';
import '../ui/views/museum_details/museum_details_view.dart';
import '../ui/views/other_museums/other_museums_view.dart';
import '../ui/views/splash/splash_view.dart';
import '../ui/views/tour/customize/customize_tour_view.dart';
import '../ui/views/tour/exposition/exposition_tour_view.dart';
import '../ui/views/tour/finish/finish_tour_view.dart';

export 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: [
    MaterialRoute(page: SplashView, initial: true),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: MuseumDetailsView),
    MaterialRoute(page: OtherMuseumsView),
    MaterialRoute(page: CustomizeTourView),
    MaterialRoute(page: ExpositionTourView),
    MaterialRoute(page: FinishTourView),
  ],
)
class $AppRouter {}
