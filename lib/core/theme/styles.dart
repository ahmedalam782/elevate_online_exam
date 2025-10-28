import 'package:flutter/material.dart';

abstract class Styles {
  // --- Legacy fixed styles (kept for backward compatibility) ---

  // --- Responsive TextStyle factories ---
  // Use these helpers in widgets to get TextStyles that scale to screen width.
  // Example: Styles.regular(context, 16)

  static double _scaleFontSize(BuildContext context, double size) {
    // Base width chosen as 375.0 (iPhone 11 / typical reference)
    final width = MediaQuery.of(context).size.width;
    final scale = width / 375.0;
    // Clamp scale to reasonable bounds to avoid extremely small/large text
    final clamped = scale.clamp(0.75, 1.25);
    return (size * clamped);
  }

  static TextStyle regular(BuildContext context, double size, {Color? color}) {
    return TextStyle(
      color: color,
      fontSize: _scaleFontSize(context, size),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle light(BuildContext context, double size, {Color? color}) {
    return TextStyle(
      color: color,
      fontSize: _scaleFontSize(context, size),
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle medium(BuildContext context, double size, {Color? color}) {
    return TextStyle(
      color: color,
      fontSize: _scaleFontSize(context, size),
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle semiBold(BuildContext context, double size, {Color? color}) {
    return TextStyle(
      color: color,
      fontSize: _scaleFontSize(context, size),
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle bold(BuildContext context, double size, {Color? color}) {
    return TextStyle(
      color: color,
      fontSize: _scaleFontSize(context, size),
      fontWeight: FontWeight.w700,
    );
  }
}
