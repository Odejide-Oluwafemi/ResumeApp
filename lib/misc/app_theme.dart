import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_app/misc/app_colors.dart';

class AppTheme with ChangeNotifier {
  static bool _isDark = false;

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

  static ThemeData darkTheme = ThemeData(
    fontFamily: GoogleFonts.rubik().fontFamily,
    primaryColor: Colors.black,
    appBarTheme: AppBarTheme(
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

  ThemeMode currentTheme() {
    return _isDark ? ThemeMode.dark : ThemeMode.light;
  }

  void switchTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }
}
