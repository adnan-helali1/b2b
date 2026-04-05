import 'package:b2b/core/theme/app_color_scheme_extention.dart';
import 'package:b2b/core/theme/textstyles.dart';
import 'package:flutter/material.dart';

class TextsHomeSuper extends StatelessWidget {
  const TextsHomeSuper({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColorScheme>()!;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Search by name',
            style: TextStyles.font16w700.copyWith(
              color: cs.onSurface, // ✅ FIXED
            ),
          ),
          Text(
            'See all',
            style: TextStyles.font15w700.copyWith(
              color: cs.primary, // ✅ FIXED
            ),
          ),
        ],
      ),
    );
  }
}
