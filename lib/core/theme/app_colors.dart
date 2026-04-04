import 'package:flutter/material.dart';

class AppColors {
  // ------------------------------------------------------------
  // BRAND COLORS (from blue accents in UI)
  // ------------------------------------------------------------
  static const Color primary = Color(
    0xFF1E40AF,
  ); // Deep business blue

  static const Color primaryDark = Color(
    0xFF1E3A8A,
  ); // Darker variant
  static const Color secondary = Color(
    0xFF3B82F6,
  ); // Bright blue accent
  static const Color secondaryDark = Color(0xFF2563EB);
  // ------------------------------------------------------------
  // SEMANTIC COLORS (from success, warning, error indicators)
  // ------------------------------------------------------------
  static const Color success = Color(0xFF16A34A); // Green

  static const Color successContainer = Color(0xFF14532D);
  static const Color warning = Color(0xFFF59E0B); // Orange

  static const Color warningContainer = Color(0xFF7C2D12);
  static const Color error = Color(0xFFDC2626); // Red

  static const Color errorContainer = Color(0xFF7F1D1D);
  static const Color info = Color(0xFF0EA5E9); // Cyan info

  static const Color infoContainer = Color(0xFF0C4A6E);
  // ------------------------------------------------------------
  // NEUTRALS (based on grey tones in UI)
  // ------------------------------------------------------------
  static const Color neutral0 = Color(0xFF0F1115);

  static const Color neutral5 = Color(0xFF111317);
  static const Color neutral10 = Color(0xFF1A1C20);
  static const Color neutral20 = Color(0xFF2A2D33);
  static const Color neutral30 = Color(0xFF3A3E45);
  static const Color neutral40 = Color(0xFF4B4F57);
  static const Color neutral50 = Color(0xFF6B7280);
  static const Color neutral60 = Color(0xFF9CA3AF);
  static const Color neutral70 = Color(0xFFD1D5DB);
  static const Color neutral80 = Color(0xFFE5E7EB);
  static const Color neutral90 = Color(0xFFF3F4F6);
  static const Color neutral95 = Color(0xFFF9FAFB);
  static const Color neutral99 = Color(0xFFFCFEFF);
  // ------------------------------------------------------------
  // SURFACES (from card backgrounds & app backgrounds)
  // ------------------------------------------------------------
  static const Color lightBackground = neutral95;

  static const Color lightSurface = neutral99;
  static const Color lightSurfaceVariant = neutral90;
  static const Color darkBackground =
      neutral5; // Matches dark UI screens

  static const Color darkSurface = neutral10;
  static const Color darkSurfaceVariant = neutral20;
  // ------------------------------------------------------------
  // OUTLINES / BORDERS
  // ------------------------------------------------------------
  static const Color lightOutline = neutral80;

  static const Color darkOutline = neutral40;
  AppColors._();
}
