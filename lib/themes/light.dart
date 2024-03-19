import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.green,
    onPrimary: const Color.fromARGB(199, 246, 252, 249),
    onSecondary: const Color.fromARGB(255, 0, 255, 179),

    // ···
    brightness: Brightness.light,
  ),
  textTheme: TextTheme(
    headlineLarge:
        GoogleFonts.outfit(fontSize: 40, fontWeight: FontWeight.w600),
    headlineMedium:
        GoogleFonts.outfit(fontSize: 20, fontWeight: FontWeight.w600),
    headlineSmall:
        GoogleFonts.outfit(fontSize: 20, fontWeight: FontWeight.w500),
    bodyMedium: GoogleFonts.sora(fontSize: 15, fontWeight: FontWeight.w400),
  ),
  //add button themes
  filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(
        const Color.fromARGB(255, 0, 255, 179)),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
    ),
    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
      const EdgeInsets.all(20),
    ),
  )),
);
