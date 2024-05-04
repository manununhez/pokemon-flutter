import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokemon_flutter/features/core/resources/colors.dart';

abstract class ThemeText {
  static TextStyle textAppBarGray = GoogleFonts.lato(
      fontSize: 16,
      fontWeight: FontWeight.w900,
      textStyle: const TextStyle(color: ColorPalette.darkGray));

  static TextStyle textAppBarWhite = GoogleFonts.lato(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      textStyle: const TextStyle(color: Colors.white));

  static TextStyle headerTitle = GoogleFonts.lato(
      fontSize: 27,
      fontWeight: FontWeight.w900,
      textStyle: const TextStyle(color: Colors.white));

  static TextStyle cardItemTitle = GoogleFonts.lato(
      fontSize: 20,
      fontWeight: FontWeight.w900,
      textStyle: const TextStyle(color: Colors.white));

  static TextStyle textStatsValue = GoogleFonts.lato(
      fontSize: 12,
      fontWeight: FontWeight.w900,
      textStyle: const TextStyle(color: ColorPalette.lightGray));

  static TextStyle favoriteText = GoogleFonts.lato(
      fontSize: 12,
      fontWeight: FontWeight.w900,
      textStyle: const TextStyle(color: Colors.white));
}
