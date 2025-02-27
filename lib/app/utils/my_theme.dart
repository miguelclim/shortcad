import 'package:flutter/material.dart';

final ColorScheme myDarkColorScheme = ColorScheme.dark(
  primary: Color(0xFF121212), // Color principal (negro/gris oscuro)
  onPrimary:
      Color(0xFFFFFFFF), // Color del texto en elementos primarios (blanco)
  secondary: Color(0xFF1E88E5), // Color secundario (azul)
  onSecondary: Color(0xFFFFFFFF), // Texto sobre el color secundario
  background: Color(0xFF1E1E1E), // Fondo principal (gris oscuro)
  onBackground:
      Color(0xFFE0E0E0), // Texto sobre el fondo principal (gris claro)
  surface: Color(0xFF2C2C2C), // Color para tarjetas y modales (gris oscuro)
  onSurface: Color(0xFFFFFFFF), // Texto en superficies
  error: Color(0xFFD32F2F), // Color de error (rojo)
  onError: Color(0xFFFFFFFF), // Texto en elementos de error
);

final ThemeData myDarkTheme = ThemeData(
  useMaterial3: true, // Habilita Material 3
  colorScheme: myDarkColorScheme, // Asignamos nuestro ColorScheme
  scaffoldBackgroundColor: myDarkColorScheme.background,
  appBarTheme: AppBarTheme(
    backgroundColor: myDarkColorScheme.primary,
    iconTheme: IconThemeData(color: myDarkColorScheme.onPrimary),
    titleTextStyle: TextStyle(color: myDarkColorScheme.onPrimary, fontSize: 20),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: myDarkColorScheme.secondary,
      foregroundColor: myDarkColorScheme.onSecondary,
    ),
  ),
);
