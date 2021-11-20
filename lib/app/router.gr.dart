// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;

import '../ui/views/home/home_view.dart' as _i2;
import '../ui/views/museum_details/museum_details_view.dart' as _i3;
import '../ui/views/other_museums/other_museums_view.dart' as _i4;
import '../ui/views/splash/splash_view.dart' as _i1;
import '../ui/views/tour/customize/customize_tour_view.dart' as _i5;
import '../ui/views/tour/exposition/exposition_tour_view.dart' as _i6;
import '../ui/views/tour/finish/finish_tour_view.dart' as _i7;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashView());
    },
    HomeRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.HomeView());
    },
    MuseumDetailsRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.MuseumDetailsView());
    },
    OtherMuseumsRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.OtherMuseumsView());
    },
    CustomizeTourRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.CustomizeTourView());
    },
    ExpositionTourRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.ExpositionTourView());
    },
    FinishTourRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.FinishTourView());
    }
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(SplashRoute.name, path: '/'),
        _i8.RouteConfig(HomeRoute.name, path: '/home-view'),
        _i8.RouteConfig(MuseumDetailsRoute.name, path: '/museum-details-view'),
        _i8.RouteConfig(OtherMuseumsRoute.name, path: '/other-museums-view'),
        _i8.RouteConfig(CustomizeTourRoute.name, path: '/customize-tour-view'),
        _i8.RouteConfig(ExpositionTourRoute.name,
            path: '/exposition-tour-view'),
        _i8.RouteConfig(FinishTourRoute.name, path: '/finish-tour-view')
      ];
}

/// generated route for [_i1.SplashView]
class SplashRoute extends _i8.PageRouteInfo<void> {
  const SplashRoute() : super(name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for [_i2.HomeView]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute() : super(name, path: '/home-view');

  static const String name = 'HomeRoute';
}

/// generated route for [_i3.MuseumDetailsView]
class MuseumDetailsRoute extends _i8.PageRouteInfo<void> {
  const MuseumDetailsRoute() : super(name, path: '/museum-details-view');

  static const String name = 'MuseumDetailsRoute';
}

/// generated route for [_i4.OtherMuseumsView]
class OtherMuseumsRoute extends _i8.PageRouteInfo<void> {
  const OtherMuseumsRoute() : super(name, path: '/other-museums-view');

  static const String name = 'OtherMuseumsRoute';
}

/// generated route for [_i5.CustomizeTourView]
class CustomizeTourRoute extends _i8.PageRouteInfo<void> {
  const CustomizeTourRoute() : super(name, path: '/customize-tour-view');

  static const String name = 'CustomizeTourRoute';
}

/// generated route for [_i6.ExpositionTourView]
class ExpositionTourRoute extends _i8.PageRouteInfo<void> {
  const ExpositionTourRoute() : super(name, path: '/exposition-tour-view');

  static const String name = 'ExpositionTourRoute';
}

/// generated route for [_i7.FinishTourView]
class FinishTourRoute extends _i8.PageRouteInfo<void> {
  const FinishTourRoute() : super(name, path: '/finish-tour-view');

  static const String name = 'FinishTourRoute';
}
