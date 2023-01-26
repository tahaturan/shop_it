import 'package:flutter/material.dart';
import 'package:shop_it/product/constants/project_colors.dart';
import 'package:shop_it/product/constants/project_padding.dart';

class ProjectTheme {
  static ThemeData theme = ThemeData(
    useMaterial3: true,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ProjectColors.buttonColor.color(),
        foregroundColor: Colors.white,
        padding: ProjectPadding.buttonPadding,
      ),
    ),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
  );
}
