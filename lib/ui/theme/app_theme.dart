import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_manager/constants/app_colors.dart';

class AppTheme {
  ThemeData lightTheme(context) => ThemeData.light().copyWith(
    primaryColor: AppColors.blueColor,
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xFFFBFBFD).withOpacity(0.98),
    colorScheme: const ColorScheme.light(primary: AppColors.blueColor),
    appBarTheme: const AppBarTheme(),
    tabBarTheme: const TabBarTheme(),
    textTheme: GoogleFonts.poppinsTextTheme(
      Theme.of(context).textTheme.apply(
        bodyColor: Colors.black,
      ),
    ),
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
  );
}
