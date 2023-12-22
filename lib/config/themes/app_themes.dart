import 'package:currency_calculator/config/themes/color_schemes.g.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



  ThemeData theme() {
    return ThemeData(
      // splashColor: Colors.transparent,,
      colorScheme: lightColorScheme,
      // splashFactory: NoSplash.splashFactory,
      useMaterial3: true,
      textSelectionTheme: TextSelectionThemeData(
        selectionHandleColor: lightColorScheme.tertiary,
        selectionColor : lightColorScheme.tertiary
      ),
      textTheme:   TextTheme(

          displayMedium: GoogleFonts.roboto(
            fontSize: 14,
            fontWeight: FontWeight.w400
          ),
          headlineSmall: GoogleFonts.roboto(
            fontSize: 13,
            fontWeight: FontWeight.w400
          ) ,
          headlineLarge: GoogleFonts.roboto(
            fontSize: 25,
            fontWeight: FontWeight.w600
          ),
          headlineMedium: GoogleFonts.roboto(
            fontSize: 16,
            fontWeight: FontWeight.w700
          ),
          labelLarge: GoogleFonts.roboto(
            fontSize: 16,
            fontWeight: FontWeight.w600
          ),
          labelMedium: GoogleFonts.roboto(
            fontSize: 13,
            fontWeight: FontWeight.w500
          ),
          labelSmall: GoogleFonts.roboto(
          fontSize: 12,
        fontWeight: FontWeight.w700
      ),
        bodyMedium: GoogleFonts.roboto(
          fontSize: 12,
          fontWeight: FontWeight.w500
        ),
        bodySmall: GoogleFonts.roboto(
          fontSize: 11,
          fontWeight: FontWeight.w400
        ),
          bodyLarge: GoogleFonts.roboto(
          fontSize: 14,
          fontWeight: FontWeight.w700
      )



      ),
    );
  }
