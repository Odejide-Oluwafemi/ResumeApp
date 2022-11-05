import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_app/misc/app_colors.dart';

/// Controls the current Theme of the app
class AppTheme with ChangeNotifier {
  /// Should use dark mode?
  static bool _isDark = false;

  /// The [ThemeData] to use when themeMode is [ThemeMode.light].
  /// Basically the light theme data.
  static ThemeData appTheme = ThemeData(
    fontFamily: GoogleFonts.rubik().fontFamily,
    primaryColor: AppColors.appColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.appColor,
    ),
    canvasColor: AppColors.appColor,
    textTheme: TextTheme(
      labelMedium: TextStyle(
        color: Colors.white,
        fontFamily: GoogleFonts.rubik().fontFamily,
      ),
      labelSmall: TextStyle(
        color: AppColors.textColor,
        fontFamily: GoogleFonts.rubik().fontFamily,
      ),
      labelLarge: TextStyle(
        color: Colors.black,
        fontFamily: GoogleFonts.rubik().fontFamily,
      ),
    ),
  );

  /// The [ThemeData] to use when themeMode is [ThemeMode.dark].
  /// Basically the dark theme data.
  static ThemeData darkTheme = ThemeData(
    fontFamily: GoogleFonts.rubik().fontFamily,
    primaryColor: Colors.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
    ),
    canvasColor: Colors.black,
    textTheme: TextTheme(
      labelMedium: TextStyle(
        color: Colors.white,
        fontFamily: GoogleFonts.rubik().fontFamily,
      ),
      labelSmall: TextStyle(
        color: Colors.white,
        fontFamily: GoogleFonts.rubik().fontFamily,
      ),
      labelLarge: TextStyle(
        color: Colors.white,
        fontFamily: GoogleFonts.rubik().fontFamily,
      ),
    ),
    cardColor: Colors.black,
  );

  /// Checks for the Current Theme
  ThemeMode currentTheme() {
    return _isDark ? ThemeMode.dark : ThemeMode.light;
  }

  /// Toggle between [ThemeMode.light] and [ThemeMode.dark]
  void switchTheme() {
    _isDark = !_isDark;
    // Update
    notifyListeners();
  }

  /// Sets the [ThemeMode] to the selected [mode]
  void setTheme(ThemeMode mode) {
    if (mode == ThemeMode.dark) {
      _isDark = true;
    } else {
      _isDark = false;
    }
    // Update
    notifyListeners();
  }
}
