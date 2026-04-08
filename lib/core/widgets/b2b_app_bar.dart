import 'package:b2b/core/helpers/spacing.dart';
import 'package:b2b/core/theme/textstyles.dart';
import 'package:b2b/core/theme/theme_mode_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class B2bAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const B2bAppBar({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return AppBar(
      backgroundColor: cs.surface,
      elevation: 1,
      automaticallyImplyLeading: false,
      titleSpacing: 16,

      title: Row(
        children: [
          Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: cs.primary,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: cs.onPrimary, size: 20),
          ),
          horizontalSpace(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyles.font18Bold.copyWith(color: cs.onSurface),
              ),
              Text(
                subtitle,
                style: TextStyles.font14.copyWith(color: cs.onSurfaceVariant),
              ),
            ],
          ),
        ],
      ),

      actions: [
        IconButton(
          icon: Icon(
            Theme.of(context).brightness == Brightness.light
                ? Icons.dark_mode_outlined
                : Icons.light_mode_outlined,
            color: cs.onSurface,
          ),
          onPressed: () {
            context.read<ThemeModeCubit>().toggle();
          },
        ),
        IconButton(
          icon: Icon(Icons.logout, color: cs.error),
          onPressed: () {},
        ),
        horizontalSpace(8.w),
      ],
    );
  }
}
