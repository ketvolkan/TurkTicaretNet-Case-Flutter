import '../core/variables/colors.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: primaryColor,
    backgroundColor: ColorTable.backgroundColor,
    scaffoldBackgroundColor: ColorTable.backgroundColor,
    appBarTheme: const AppBarTheme().copyWith(
      backgroundColor: ColorTable.backgroundColor,
      titleTextStyle: const TextStyle().copyWith(fontFamily: "Roboto Flex"),
    ),
  );
}
