import 'package:flutter/material.dart';

abstract class AppColors {
  // --- Primary and Brand Colors ---
  static const Color prime = Color(0xFF02369C); // main brand color
  static const Color primeAccent = Color(0xFF11CE19); // accent/brand green

  // --- Light Theme Colors ---
  static const Color primaryLight = Color(0xFF02369C); // prime
  static const Color secondaryLight = Color(0xFFCCD7EB); // light blue
  static const Color backgroundLight = Color(0xFFF9F9F9); // background
  static const Color surfaceLight = Color(0xFFEDEFF3); // card/surface
  static const Color errorLight = Color(0xFFF8D2D2); // error
  static const Color onPrimaryLight = Color(0xFFFFFFFF); // text on primary
  static const Color onSecondaryLight = Color(0xFF011B4E); // text on secondary
  static const Color onBackgroundLight = Color(
    0xFF0F0F0F,
  ); // text on background
  static const Color onSurfaceLight = Color(0xFF373737); // text on surface
  static const Color onErrorLight = Color(0xFFCC1010); // text on error

  // --- Dark Theme Colors ---
  static const Color primaryDark = Color(0xFF809ACD); // lighter blue
  static const Color secondaryDark = Color(0xFF5679BD); // blue
  static const Color backgroundDark = Color(0xFF011234); // dark background
  static const Color surfaceDark = Color(0xFF011B4E); // dark card/surface
  static const Color errorDark = Color(0xFFCC1010); // error
  static const Color onPrimaryDark = Color(0xFFF9F9F9); // text on primary
  static const Color onSecondaryDark = Color(0xFFF9F9F9); // text on secondary
  static const Color onBackgroundDark = Color(0xFFF9F9F9); // text on background
  static const Color onSurfaceDark = Color(0xFFF9F9F9); // text on surface
  static const Color onErrorDark = Color(0xFFF8D2D2); // text on error

  // --- Grays and Neutrals ---
  static const Color grayA6 = Color(0xFFA6A6A6);
  static const Color grayCF = Color(0xFFCFCFCF);
  static const Color grayAF = Color(0xFFAFAFAF);
  static const Color gray87 = Color(0xFF878787);
  static const Color gray5F = Color(0xFF5F5F5F);
  static const Color gray37 = Color(0xFF373737);
  static const Color gray0D = Color(0xFF0D0D0D);
  static const Color gray0A = Color(0xFF0A0A0A);
  static const Color gray08 = Color(0xFF080808);
  static const Color gray05 = Color(0xFF050505);
  static const Color gray03 = Color(0xFF030303);
  static const Color gray53 = Color(0xFF535353);

  // --- Blues ---
  static const Color blue2C = Color(0xFF2C58AC);
  static const Color blue02 = Color(0xFF022D82);
  static const Color blue01 = Color(0xFF012468);
  static const Color blue011B = Color(0xFF011B4E);
  static const Color blue0112 = Color(0xFF011234);
  static const Color blue000B = Color(0xFF000B1F);
  static const Color blueDF = Color(0xFFDFE7F7);

  // --- Utility Colors ---
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color black1D = Color(0xFF1D192B);
  static const Color transparent = Colors.transparent;

  // --- Gradients ---
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF02369C), Color(0xFF11CE19)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
