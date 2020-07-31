// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../ui/views/home/home_view.dart';
import '../ui/views/museum_details/museum_details_view.dart';
import '../ui/views/other_museums/other_museums_view.dart';
import '../ui/views/tour/customize/customize_tour_view.dart';
import '../ui/views/tour/exposition/exposition_tour_view.dart';
import '../ui/views/tour/finish/finish_tour_view.dart';

class Routes {
  static const String homeView = '/';
  static const String museumDetailsView = '/museum-details-view';
  static const String otherMuseumsView = '/other-museums-view';
  static const String customizeTourView = '/customize-tour-view';
  static const String expositionTourView = '/exposition-tour-view';
  static const String finishTourView = '/finish-tour-view';
  static const all = <String>{
    homeView,
    museumDetailsView,
    otherMuseumsView,
    customizeTourView,
    expositionTourView,
    finishTourView,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.museumDetailsView, page: MuseumDetailsView),
    RouteDef(Routes.otherMuseumsView, page: OtherMuseumsView),
    RouteDef(Routes.customizeTourView, page: CustomizeTourView),
    RouteDef(Routes.expositionTourView, page: ExpositionTourView),
    RouteDef(Routes.finishTourView, page: FinishTourView),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const HomeView(),
        settings: data,
      );
    },
    MuseumDetailsView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const MuseumDetailsView(),
        settings: data,
      );
    },
    OtherMuseumsView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const OtherMuseumsView(),
        settings: data,
      );
    },
    CustomizeTourView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const CustomizeTourView(),
        settings: data,
      );
    },
    ExpositionTourView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ExpositionTourView(),
        settings: data,
      );
    },
    FinishTourView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const FinishTourView(),
        settings: data,
      );
    },
  };
}
