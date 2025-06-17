/*
  Theme işleminin Açıklaması:
  Burada Aydınlık ve karanlık tema modlar yapılır.

*/

import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._(); // bu class'dan nesne oluşturmayı engeller.
  static ThemeData get lightTheme => ThemeData(
      scaffoldBackgroundColor: Colors.white,  // Uygulamanın arka plan rengi belirtilir.
      fontFamily: 'Inter',  // Uygulamanın yazı fontu belirtilir. pubspec.yaml -> font girdisi yapılır.
      colorScheme: ColorScheme.light(   // uygulamada kullanılan renk temasını tanımlar ve light tema için varsayılan bir renk şeması oluşturur.
        primary: Color(0xFF42B4CA),   // Uygulamanın ana rengi belirtilir.
        secondary: Color(0xFFD5E9ED), // Uygulamanın ikincil rengi belirtilir.
        surface: Colors.white,    // Genellikle kartlar, paneller veya arka plan gibi yüzeylerin rengidir. appBar ve bottomNavigation rengi belirlenir.
        onSurface: Color(0xFF414A4C), //Yüzey üzerinde kullanılan (örneğin metin veya ikonlar için) birincil renk.
        error: Color(0xFFEA7979),   // Hata mesajları
        tertiary: Color(0xFFB5C4C7),  // Üçüncül renk, genellikle ek vurgu veya tamamlayıcı stil
      ),
      iconButtonTheme: IconButtonThemeData(style: IconButton.styleFrom(foregroundColor: Color(0xFF42B4CA)))
  );
}