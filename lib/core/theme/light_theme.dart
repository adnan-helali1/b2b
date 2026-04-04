import 'package:b2b/core/theme/app_color_scheme_extention.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,

  colorScheme: const ColorScheme.light(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    surface: AppColors.lightSurface,
    error: AppColors.error,
  ),

  scaffoldBackgroundColor: AppColors.lightBackground,

  extensions: const [
    AppColorScheme(
      success: AppColors.success,
      warning: AppColors.warning,
      info: AppColors.info,
      cardBackground: AppColors.lightSurface,
      borderColor: AppColors.lightOutline,
    ),
  ],
);
