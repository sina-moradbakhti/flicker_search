import 'package:flutter/material.dart';

class AppThemes {
  static final ThemeData defaultMaterialTheme = ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        scrolledUnderElevation: 0,
      ));
}
