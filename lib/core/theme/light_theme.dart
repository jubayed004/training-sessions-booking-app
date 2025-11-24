import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_trainer/utils/color/app_colors.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.backgroundColor,
  fontFamily: GoogleFonts.nunito().fontFamily,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.backgroundColor,
    elevation: 0,
    titleTextStyle: GoogleFonts.nunito(
      fontWeight: FontWeight.w800,
      fontSize: 20,
      color: AppColors.black,
    ),
    iconTheme: IconThemeData(color: AppColors.grayTertiaryTextColor),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primaryColor,
      foregroundColor: AppColors.white,
      minimumSize: const Size(140, 32),
      padding: const EdgeInsets.all(10),
      shape: CircleBorder(side: BorderSide(color: AppColors.primaryColor)),
      textStyle: GoogleFonts.nunito(fontSize: 14, fontWeight: FontWeight.w600),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      side: const BorderSide(color: AppColors.bgSecondaryButtonColor),
      foregroundColor: Colors.black,
      minimumSize: const Size(186, 48),
      padding: const EdgeInsets.all(10),
      shape: CircleBorder(side: BorderSide(color: AppColors.bgSecondaryButtonColor)),
      textStyle: GoogleFonts.nunito(fontSize: 14, fontWeight: FontWeight.w600),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.primaryColor,
      textStyle: GoogleFonts.nunito(
        fontWeight: FontWeight.w600,
        fontSize: 14,
        decoration: TextDecoration.underline,
      ),
    ),
  ),
  iconTheme: const IconThemeData(color: AppColors.grayTertiaryTextColor),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.backgroundColor,
    iconColor: AppColors.grayTextSecondaryColor,
    prefixIconColor: AppColors.grayTextSecondaryColor,
    suffixIconColor: AppColors.grayTextSecondaryColor,
    contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.linesDarkColor),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.linesDarkColor),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(width: 2, color: AppColors.redColor),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(width: 2, color: AppColors.redColor),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.linesDarkColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.linesDarkColor),
    ),
    hintStyle: GoogleFonts.nunito(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.blackMainTextColor,
    ),
    errorStyle: GoogleFonts.nunito(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.redColor,
    ),
  ),
  textTheme: TextTheme(
    headlineSmall: GoogleFonts.nunito(
      fontSize: 24,
      fontWeight: FontWeight.w800,
      color: AppColors.blackMainTextColor,
    ),
    titleLarge: GoogleFonts.nunito(
      fontSize: 18,
      fontWeight: FontWeight.w800,
      color: AppColors.blackMainTextColor,
    ),
    titleMedium: GoogleFonts.nunito(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.blackMainTextColor,
    ),
    titleSmall: GoogleFonts.nunito(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: AppColors.blackMainTextColor,
    ),
    bodyLarge: GoogleFonts.nunito(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.blackMainTextColor,
    ),
    bodyMedium: GoogleFonts.nunito(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.blackMainTextColor,
    ),
    bodySmall: GoogleFonts.nunito(
      fontSize: 12,
      fontWeight: FontWeight.w200,
      color: AppColors.grayTertiaryTextColor,
    ),
  ),
);
