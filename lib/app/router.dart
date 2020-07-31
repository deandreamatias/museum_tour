import 'package:auto_route/auto_route_annotations.dart';

import '../ui/views/home/home_view.dart';
import '../ui/views/museum_details/museum_details_view.dart';
import '../ui/views/other_museums/other_museums_view.dart';

@MaterialAutoRouter(routes: [
  MaterialRoute(page: HomeView, initial: true),
  MaterialRoute(page: MuseumDetailsView),
  MaterialRoute(page: OtherMuseumsView),
])
class $Router {}
