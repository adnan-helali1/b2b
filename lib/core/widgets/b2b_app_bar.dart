import 'package:b2b/core/helpers/spacing.dart';
import 'package:b2b/core/theme/colors.dart';
import 'package:b2b/core/theme/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class B2bAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  B2bAppBar({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorsManegar.white,
      elevation: 1,
      automaticallyImplyLeading: false,
      titleSpacing: 16,
      title: Row(
        children: [
          Container(
            width: 40.w,
            height: 40.h,
            decoration: const BoxDecoration(
              color: ColorsManegar.backgroundIcon,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: ColorsManegar.white,
              size: 20,
            ),
          ),
          horizontalSpace(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyles.font18BlackBold,
              ),
              Text(
                subtitle,
                style: TextStyles.font14grye600,
              ),
            ],
          ),
        ],
      ),

      actions: [
        IconButton(
          icon: const Icon(
            Icons.dark_mode_outlined,
            color: ColorsManegar.blac,
          ),
          onPressed: () {
            // TODO: toggle theme
          },
        ),
        IconButton(
          icon: const Icon(Icons.logout, color: Colors.red),
          onPressed: () {
            // TODO: logout
          },
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}
