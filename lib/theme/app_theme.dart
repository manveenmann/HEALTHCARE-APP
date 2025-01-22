// lib/app_theme.dart
import 'package:flutter/material.dart';
import 'app_colors.dart';

final ThemeData appTheme = ThemeData(
  primaryColor: AppColors.primaryColor,
  scaffoldBackgroundColor: AppColors.backgroundColor,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: AppColors.primaryColor,
    secondary: AppColors.secondaryColor,
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.backgroundColor.withOpacity(0.2),
    labelStyle: TextStyle(color: AppColors.primaryColor),
    prefixIconColor: AppColors.primaryColor,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.primaryColor),
      borderRadius: BorderRadius.circular(8.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.secondaryColor),
      borderRadius: BorderRadius.circular(8.0),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: AppColors.primaryColor,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.secondaryColor,
    ),
  ),
);
