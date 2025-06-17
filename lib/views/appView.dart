import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppView extends StatelessWidget {
  final StatefulNavigationShell navigationShell; // navigationShell hangi sayfada olduğumuzu tutar.
  const AppView({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarWidget(),
      body: navigationShell,
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            labelTextStyle: WidgetStateTextStyle.resolveWith(
          (states) {
            if (states.contains((WidgetState.selected))) {
              return TextStyle(color: Theme.of(context).colorScheme.primary);
            }

            return TextStyle(color: Theme.of(context).colorScheme.tertiary);
          },
        )),
        child: NavigationBar(
            selectedIndex: navigationShell
                .currentIndex, // Seçili olan Index'i buraya bağlarız.
            indicatorColor: Colors.transparent,
            // goBranch daki Index değeri index'e atanır.
            // onDestinationSelected: (index) => navigationShell.goBranch(index),
            onDestinationSelected: navigationShell.goBranch,
            destinations: [
              _menuItem(context,
                  index: 0,
                  currentIndex: navigationShell.currentIndex,
                  label: "Character",
                  icon: Icons.face),
              _menuItem(context,
                  index: 1,
                  currentIndex: navigationShell.currentIndex,
                  label: "Favorite",
                  icon: Icons.bookmark),
              _menuItem(context,
                  index: 2,
                  currentIndex: navigationShell.currentIndex,
                  label: "Location",
                  icon: Icons.location_on),
              _menuItem(context,
                  index: 3,
                  currentIndex: navigationShell.currentIndex,
                  label: "Menus",
                  icon: Icons.menu),
            ]),
      ),
    );
  }

  // NavigationBottomBar theme kısmı için yapıldı.
  Widget _menuItem(BuildContext context,
      {required int index,  // Menünün belirtilen index değeri
      required int currentIndex,  // Kullanıcının bulunduğu index değeri
      required String label,  // Icon altında görünün yazı
      required IconData icon}) {  // Icon değeri
    return NavigationDestination( // Widget'ı döndürür ve hedef konumu temsil eder.
        icon: Icon( icon,
          color: currentIndex == index  // renk şu şekilde yapıldı. Eğer kulllanıcının index değeri belirtilen indexlerden birine eşit ise 
          // theme.dart'tan colorScheme çekerek hangisini kullanılıcağı belirtilir.
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.tertiary,
        ),
        label: label);
  }

  /*
    Uygulamanını AppBar kısmınıdaki işlevler bulunur.
  */
  // '_' ile başlanırsa private özellik alır diğer yerlerden ulaşılamaz.
  AppBar _appBarWidget() {
    return AppBar(
      title: Text("Rick and Morty", style: TextStyle(fontWeight: FontWeight.w500),
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
