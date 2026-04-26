import 'package:b2b/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:b2b/modules/admin/features/home/ui/widgets/admin_icons.dart';
import 'package:b2b/core/theme/colors.dart';
import 'package:b2b/core/theme/textstyles.dart';
import 'package:b2b/core/helpers/spacing.dart';

class AppbarFirstContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    //final mn= Theme.of(context). extension<AppColors>()!;
    // TODO: implement build
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(color:AppColors.lightSurface, borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.neutral60.withOpacity(0.5),
          width: 1,
        ), ),
      child: Row(
        children: [
          AdminIcons(
            circulcolor: AppColors.primary,
            icon: Icons.add_moderator_outlined,
            iconcolor: AppColors.lightBackground,
          ),
          horizontalSpace(20),
          Column(
            children: [
              Text('لوحة الادارة', style: TextStyles.font16bold),
              verticalSpace(20),
              Text('مدير النظام', style: TextStyles.font12normal),
            ],
          ),
         horizontalSpace(75),
          AdminIcons(
            circulcolor: AppColors.lightSurface,
            icon: Icons.dark_mode_outlined,
            iconcolor: cs.primary,
          ),
          AdminIcons(
            circulcolor: AppColors.lightSurface,
            icon: Icons.arrow_forward,
            iconcolor: Colors.red,
          ),
        ],
      ),
    );
  }
}
