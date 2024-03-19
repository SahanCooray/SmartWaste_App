import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.green,

    // ···
    brightness: Brightness.light,
  ),
  textTheme: TextTheme(
    headlineLarge:
        GoogleFonts.roboto(fontSize: 34, fontWeight: FontWeight.w700),
    headlineMedium:
        GoogleFonts.roboto(fontSize: 24, fontWeight: FontWeight.w600),
    headlineSmall:
        GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w500),
  ),
);
