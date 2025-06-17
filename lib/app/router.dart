import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rickandmorty/views/appView.dart';
import 'package:rickandmorty/views/characters_view/characters_view.dart';
import 'package:rickandmorty/views/favourites_view/favourites_view.dart';
import 'package:rickandmorty/views/location_view/locations_view.dart';
import 'package:rickandmorty/views/sections_view/sections_view.dart';

final _routerKey = GlobalKey<NavigatorState>(); // navigsayon yığınıdır.

class AppRoute {
  AppRoute._(); // Nesne oluşumunu engeller.
  static const String characters = '/';
  static const String favourites = '/favorites'; // 'favoutires' yazım hatası düzeltildi
  static const String locations = '/locations';
  static const String sections = '/sections';
}
// Yönlendirme işlemleri yönetmek için kullanılan bir paket
final router = GoRouter(
  navigatorKey: _routerKey, // Navigasyon yığını kontrol eder.
  initialLocation: AppRoute.characters, // Uygulamada açılırken ilk açılıcak pencere
  routes: [ // Uygulamanın rotasını belirler.
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) => AppView(navigationShell: navigationShell),  // Ana görünüm widget'ı AppView dalında taşır.
      branches: [ // Her dal farklı bir navigasyonu temsil eder. Burada tek dal belirtilmiş bu sayede StatefulShellBranch tanımlanmış
        StatefulShellBranch(  // Birden fazla navigasyonu dalını (branch) destekler. Çoğunlukla BottomNavigationBar ile kullanılır
          routes: [
            GoRoute(
              path: AppRoute.characters,  // Rota yolu characters
              builder: (context, state) => const CharactersView(),  // Bu yola gidildiğinde gösterilicek widget CharactesView().
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