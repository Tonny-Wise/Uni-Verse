import 'package:flutter/material.dart';

/// App color palette matching V0 design
/// Using neutral grayscale with accent colors
class AppColors {
  AppColors._();

  // ─── Light Mode Colors ───────────────────────────────────────────────────
  static const Color lightBackground = Color(0xFFFFFFFF);
  static const Color lightForeground = Color(0xFF0A0A0A);
  static const Color lightCard = Color(0xFFFFFFFF);
  static const Color lightCardForeground = Color(0xFF0A0A0A);
  static const Color lightPrimary = Color(0xFF171717);
  static const Color lightPrimaryForeground = Color(0xFFFAFAFA);
  static const Color lightSecondary = Color(0xFFF5F5F5);
  static const Color lightSecondaryForeground = Color(0xFF171717);
  static const Color lightMuted = Color(0xFFF5F5F5);
  static const Color lightMutedForeground = Color(0xFF737373);
  static const Color lightAccent = Color(0xFFF5F5F5);
  static const Color lightAccentForeground = Color(0xFF171717);
  static const Color lightBorder = Color(0xFFE5E5E5);
  static const Color lightInput = Color(0xFFE5E5E5);
  static const Color lightRing = Color(0xFFA3A3A3);
  static const Color lightDestructive = Color(0xFFEF4444);
  static const Color lightDestructiveForeground = Color(0xFFFFFFFF);

  // ─── Dark Mode Colors ────────────────────────────────────────────────────
  static const Color darkBackground = Color(0xFF0A0A0A);
  static const Color darkForeground = Color(0xFFFAFAFA);
  static const Color darkCard = Color(0xFF0A0A0A);
  static const Color darkCardForeground = Color(0xFFFAFAFA);
  static const Color darkPrimary = Color(0xFFFAFAFA);
  static const Color darkPrimaryForeground = Color(0xFF171717);
  static const Color darkSecondary = Color(0xFF262626);
  static const Color darkSecondaryForeground = Color(0xFFFAFAFA);
  static const Color darkMuted = Color(0xFF262626);
  static const Color darkMutedForeground = Color(0xFFA3A3A3);
  static const Color darkAccent = Color(0xFF262626);
  static const Color darkAccentForeground = Color(0xFFFAFAFA);
  static const Color darkBorder = Color(0xFF262626);
  static const Color darkInput = Color(0xFF262626);
  static const Color darkRing = Color(0xFF525252);
  static const Color darkDestructive = Color(0xFF7F1D1D);
  static const Color darkDestructiveForeground = Color(0xFFFAFAFA);

  // ─── Semantic Colors ─────────────────────────────────────────────────────
  static const Color success = Color(0xFF22C55E);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);

  // ─── Notification Type Colors ────────────────────────────────────────────
  static const Color likeColor = Color(0xFFEF4444);     // Red
  static const Color commentColor = Color(0xFF3B82F6); // Blue
  static const Color followColor = Color(0xFF8B5CF6);  // Purple
  static const Color groupColor = Color(0xFF14B8A6);   // Teal
  static const Color mentionColor = Color(0xFFF97316); // Orange
  static const Color messageColor = Color(0xFF3B82F6); // Blue

  // ─── Online Status ───────────────────────────────────────────────────────
  static const Color online = Color(0xFF22C55E);
  static const Color offline = Color(0xFF737373);

  // ─── Post Type Badge Colors ──────────────────────────────────────────────
  static const Color studyTipBadge = Color(0xFFF59E0B);
  static const Color questionBadge = Color(0xFF8B5CF6);

  // ─── University Badge Colors ─────────────────────────────────────────────
  static const List<Color> universityColors = [
    Color(0xFF3B82F6), // Blue
    Color(0xFF22C55E), // Green
    Color(0xFFF59E0B), // Amber
    Color(0xFFEF4444), // Red
    Color(0xFF8B5CF6), // Purple
    Color(0xFF14B8A6), // Teal
    Color(0xFFF97316), // Orange
    Color(0xFFEC4899), // Pink
    Color(0xFF6366F1), // Indigo
    Color(0xFF06B6D4), // Cyan
  ];

  /// Get university color by index (cycles through available colors)
  static Color getUniversityColor(int index) {
    return universityColors[index % universityColors.length];
  }
}

/// Extension to get colors based on brightness
extension AppColorsExtension on BuildContext {
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  Color get backgroundColor =>
      isDarkMode ? AppColors.darkBackground : AppColors.lightBackground;
  Color get foregroundColor =>
      isDarkMode ? AppColors.darkForeground : AppColors.lightForeground;
  Color get cardColor =>
      isDarkMode ? AppColors.darkCard : AppColors.lightCard;
  Color get cardForegroundColor =>
      isDarkMode ? AppColors.darkCardForeground : AppColors.lightCardForeground;
  Color get primaryColor =>
      isDarkMode ? AppColors.darkPrimary : AppColors.lightPrimary;
  Color get primaryForegroundColor =>
      isDarkMode ? AppColors.darkPrimaryForeground : AppColors.lightPrimaryForeground;
  Color get secondaryColor =>
      isDarkMode ? AppColors.darkSecondary : AppColors.lightSecondary;
  Color get secondaryForegroundColor =>
      isDarkMode ? AppColors.darkSecondaryForeground : AppColors.lightSecondaryForeground;
  Color get mutedColor =>
      isDarkMode ? AppColors.darkMuted : AppColors.lightMuted;
  Color get mutedForegroundColor =>
      isDarkMode ? AppColors.darkMutedForeground : AppColors.lightMutedForeground;
  Color get borderColor =>
      isDarkMode ? AppColors.darkBorder : AppColors.lightBorder;
  Color get inputColor =>
      isDarkMode ? AppColors.darkInput : AppColors.lightInput;
  Color get destructiveColor =>
      isDarkMode ? AppColors.darkDestructive : AppColors.lightDestructive;
}
