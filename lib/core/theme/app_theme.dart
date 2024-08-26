import 'package:flutter/material.dart';

class HighContrastBlackTheme {
  static ThemeData get theme {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: Colors.black,
      primary: Colors.white,
      onPrimary: Colors.black,
      secondary: Colors.grey[400]!,
      onSecondary: Colors.black,
      background: Colors.black,
      onBackground: Colors.white,
      surface: Colors.grey[800]!,
      onSurface: Colors.white,
      error: Colors.redAccent,
      onError: Colors.black,
    );

    return ThemeData(
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.background,
      textTheme: TextTheme(
        displayLarge: TextStyle(
            color: colorScheme.onBackground,
            fontSize: 32.0,
            fontWeight: FontWeight.bold),
        displayMedium: TextStyle(
            color: colorScheme.onBackground,
            fontSize: 28.0,
            fontWeight: FontWeight.bold),
        displaySmall: TextStyle(
            color: colorScheme.onBackground,
            fontSize: 24.0,
            fontWeight: FontWeight.bold),
        headlineLarge: TextStyle(
            color: colorScheme.onBackground,
            fontSize: 20.0,
            fontWeight: FontWeight.bold),
        headlineMedium: TextStyle(
            color: colorScheme.onBackground,
            fontSize: 18.0,
            fontWeight: FontWeight.bold),
        headlineSmall: TextStyle(
            color: colorScheme.onBackground,
            fontSize: 16.0,
            fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(color: colorScheme.onBackground, fontSize: 16.0),
        bodyMedium: TextStyle(color: colorScheme.onBackground, fontSize: 14.0),
        bodySmall: TextStyle(color: colorScheme.onBackground, fontSize: 12.0),
        labelLarge: TextStyle(
            color: colorScheme.onPrimary,
            fontSize: 16.0,
            fontWeight: FontWeight.bold),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: colorScheme.primary,
        textTheme: ButtonTextTheme.primary,
      ),
      cardColor: colorScheme.surface,
      dividerColor: colorScheme.onSurface.withOpacity(0.2),
      iconTheme: IconThemeData(color: colorScheme.onBackground),
      appBarTheme: AppBarTheme(
        color: colorScheme.background,
        iconTheme: IconThemeData(color: colorScheme.onBackground),
        titleTextStyle: TextStyle(
          color: colorScheme.onBackground,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: colorScheme.background,
        selectedItemColor: colorScheme.onBackground,
        unselectedItemColor: colorScheme.onSurface,
      ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.all<Color>(colorScheme.onBackground),
        trackColor: MaterialStateProperty.all<Color>(
            colorScheme.onSurface.withOpacity(0.5)),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        refreshBackgroundColor: Colors.white,
        color: colorScheme.primary,
        circularTrackColor: colorScheme.surface,
        linearTrackColor: colorScheme.surface,
      ),
    );
  }
}
