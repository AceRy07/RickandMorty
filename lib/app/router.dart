import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rickandmorty/views/appView.dart';
import 'package:rickandmorty/views/characters_view/characters_view.dart';
import 'package:rickandmorty/views/favourites_view/favourites_view.dart';
import 'package:rickandmorty/views/location_view/locations_view.dart';
import 'package:rickandmorty/views/sections_view/sections_view.dart';

final _routerKey = GlobalKey<NavigatorState>();

class AppRoute {
  AppRoute._();
  static const String characters = '/';
  static const String favourites = '/favorites'; // 'favoutires' yazım hatası düzeltildi
  static const String locations = '/locations';
  static const String sections = '/sections';
}

final router = GoRouter(
  navigatorKey: _routerKey,
  initialLocation: AppRoute.characters,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) => AppView(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoute.characters,
              builder: (context, state) => const CharactersView(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoute.favourites,
              builder: (context, state) => const FavouritesView(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoute.locations,
              builder: (context, state) => const LocationsView(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoute.sections,
              builder: (context, state) => const SectionsView(),
            ),
          ],
        ),
      ],
    ),
  ],
);