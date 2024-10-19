import 'package:flutter/material.dart';
import 'package:twitter_clone/app/themes/app_colors.dart';

class AppTheme {
  static const double h1FontSize = 24.0;
  static const double h2FontSize = 20.0;
  static const double bodyFontSize = 16.0;
  static const double smallFontSize = 14.0;

  static ThemeData get theme {
    return ThemeData(
      colorScheme: const ColorScheme(
        primary: kTwitterBlue, // Twitter's blue
        secondary: kTwitterBlack, // Black for headings
        surface: kTwitterLightGray, // Light gray for surface backgrounds
        error: kErrorRed, // Standard red for errors
        onPrimary: kTwitterWhite, // White text/icons on primary
        onSecondary: kTwitterWhite, // White text/icons on secondary
        onSurface: kTwitterBlack, // Black text on surfaces
        onError: kTwitterWhite, // White text on error surfaces
        brightness: Brightness.light, // Light mode
      ),
      scaffoldBackgroundColor: kTwitterWhite,
      textTheme: const TextTheme(
        displayLarge: TextStyle(
            fontSize: h1FontSize,
            fontWeight: FontWeight.bold,
            color: kTwitterBlack),
        displayMedium: TextStyle(
            fontSize: h2FontSize,
            fontWeight: FontWeight.bold,
            color: kTwitterBlack),
        bodyLarge: TextStyle(fontSize: bodyFontSize, color: kTwitterBlack),
        bodyMedium: TextStyle(fontSize: smallFontSize, color: kTwitterBlack),
        labelLarge: TextStyle(
            fontSize: bodyFontSize,
            fontWeight: FontWeight.bold,
            color: kTwitterWhite),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: kTwitterBlue, // Button background color
        textTheme: ButtonTextTheme.primary, // Button text color
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: kTwitterWhite,
        titleTextStyle: TextStyle(
            fontSize: h2FontSize,
            fontWeight: FontWeight.bold,
            color: kTwitterBlack),
      ),
    );
  }
}
