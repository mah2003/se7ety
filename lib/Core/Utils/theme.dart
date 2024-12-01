import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:se7ety/Core/Utils/Colors.dart';

class AppThemes {
  static ThemeData LightTheme = ThemeData(
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: Colors.red,
    ),
    scrollbarTheme: const ScrollbarThemeData(
        thumbColor: WidgetStatePropertyAll(AppColors.primary),
        radius: Radius.circular(20)),
    fontFamily: GoogleFonts.cairo().fontFamily,
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: const AppBarTheme(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.primary,
        centerTitle: true,
        elevation: 0.0,
        actionsIconTheme: IconThemeData(color: AppColors.primary),
        titleTextStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: AppColors.background)),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.background,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false),
    inputDecorationTheme: const InputDecorationTheme(
      contentPadding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
          borderSide: BorderSide.none),
      fillColor: AppColors.input,
      suffixIconColor: AppColors.primary,
      prefixIconColor: AppColors.primary,
      filled: true,
      hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        // borderSide: BorderSide(color: AppColors.primary
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        //borderSide: BorderSide(color: AppColors.primary
      ),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          borderSide: BorderSide(color: Colors.red)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          borderSide: BorderSide(color: Colors.red)),
    ),
  );
}
