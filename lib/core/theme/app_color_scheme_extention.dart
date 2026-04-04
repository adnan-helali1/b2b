import 'package:flutter/material.dart';

@immutable
class AppColorScheme
    extends ThemeExtension<AppColorScheme> {
  final Color success;
  final Color warning;
  final Color info;
  final Color cardBackground;
  final Color borderColor;

  const AppColorScheme({
    required this.success,
    required this.warning,
    required this.info,
    required this.cardBackground,
    required this.borderColor,
  });

  @override
  AppColorScheme copyWith({
    Color? success,
    Color? warning,
    Color? info,
    Color? cardBackground,
    Color? borderColor,
  }) {
    return AppColorScheme(
      success: success ?? this.success,
      warning: warning ?? this.warning,
      info: info ?? this.info,
      cardBackground: cardBackground ?? this.cardBackground,
      borderColor: borderColor ?? this.borderColor,
    );
  }

  @override
  AppColorScheme lerp(
    ThemeExtension<AppColorScheme>? other,
    double t,
  ) {
    if (other is! AppColorScheme) return this;
    return AppColorScheme(
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      info: Color.lerp(info, other.info, t)!,
      cardBackground: Color.lerp(
        cardBackground,
        other.cardBackground,
        t,
      )!,
      borderColor: Color.lerp(
        borderColor,
        other.borderColor,
        t,
      )!,
    );
  }
}
