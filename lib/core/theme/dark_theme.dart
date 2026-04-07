import 'package:b2b/core/theme/app_color_scheme_extention.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';

final darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,

  colorScheme: const ColorScheme.dark(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    surface: AppColors.darkSurface,
    error: AppColors.error,
    surfaceContainer: AppColors.blueCardDark,
    surfaceContainerHigh: AppColors.greenCardDark,
    surfaceContainerLow: AppColors.redCardDark,
    surfaceContainerHighest: AppColors.purpleCardDark,
  ),

  scaffoldBackgroundColor: AppColors.darkBackground,

  extensions: const [
    AppColorScheme(
      success: AppColors.success,
      warning: AppColors.warning,
      info: AppColors.info,
      cardBackground: AppColors.darkSurface,
      borderColor: AppColors.darkOutline,
    ),
  ],
);
