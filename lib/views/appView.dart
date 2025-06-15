import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppView extends StatelessWidget {
  final StatefulNavigationShell navigationShell;  // navigationShell hangi sayfada olduğumuzu tutar.
  const AppView({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarWidget(),
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,    // Seçili olan Index'i buraya bağlarız.
          indicatorColor: Colors.transparent,
          // goBranch daki Index değeri index'e atanır.
          onDestinationSelected: (index) => navigationShell.goBranch(index),
          // onDestinationSelected: navigationShell.goBranch,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.face), label: 'Character'),
            NavigationDestination(
                icon: Icon(Icons.bookmark), label: 'Favorite'),
            NavigationDestination(
                icon: Icon(Icons.location_on), label: 'Location'),
            NavigationDestination(icon: Icon(Icons.menu), label: 'Menus'),
          ]),
    );
  }

  // '_' ile başlanırsa private özellik alır diğer yerlerden ulaşılamaz.
  AppBar _appBarWidget() {
    return AppBar(
      title: Text(
        "Rick and Morty",
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.settings),
          onPressed: () {},
        )
      ],
    );
  }
}
