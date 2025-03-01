import 'package:flutter/material.dart';

final ColorScheme myColorScheme = ColorScheme.dark(
  primary: Color(0xFF17Cf96), // Color principal (negro/gris oscuro)
  onPrimary:Color(0xFFFFFFFF), // Color del texto en elementos primarios (blanco)
  secondary: Color(0xFF263031), // Color secundario (azul)
  onSecondary: Color(0xFFFFFFFF), // Texto sobre el color secundario
  background: Color(0xFF1C1D21), // Fondo principal (gris oscuro)
  onBackground:Color(0xFFE0E0E0), // Texto sobre el fondo principal (gris claro)
  surface: Color(0xFF2C2C2C), // Color para tarjetas y modales (gris oscuro)
  onSurface: Color(0xFFFFFFFF), // Texto en superficies
  error: Color(0xFFD32F2F), // Color de error (rojo)
  onError: Color(0xFFFFFFFF), // Texto en elementos de error
);

final ThemeData myTheme = ThemeData(
  useMaterial3: true, // Habilita Material 3
  colorScheme: myColorScheme, // Asignamos nuestro ColorScheme
  scaffoldBackgroundColor: myColorScheme.background,
  appBarTheme: AppBarTheme(
    backgroundColor: myColorScheme.primary,
    iconTheme: IconThemeData(color: myColorScheme.onPrimary),
    titleTextStyle: TextStyle(color: myColorScheme.onPrimary, fontSize: 20),
  ),
  dialogTheme: DialogTheme(
    backgroundColor: myColorScheme.background
  ),
  drawerTheme: DrawerThemeData(
    backgroundColor: myColorScheme.background
  )
);
