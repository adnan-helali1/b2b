import 'package:b2b/core/helpers/extensions.dart';
import 'package:b2b/core/helpers/spacing.dart';
import 'package:b2b/core/theme/textstyles.dart';
import 'package:b2b/core/widgets/b2b_app_bar.dart';
import 'package:b2b/modules/auth/features/account/ui/widgets/super_account_action_grid.dart';
import 'package:b2b/modules/auth/features/account/ui/widgets/super_account_header_card.dart';
import 'package:b2b/modules/auth/features/account/ui/widgets/super_account_info_section.dart';
import 'package:b2b/modules/auth/features/account/ui/widgets/super_account_settings_section.dart';
import 'package:b2b/modules/auth/features/account/ui/widgets/super_account_stat_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/super_account_data.dart';

class SuperAccountScreen extends StatelessWidget {
  const SuperAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = context.cs;

    return Scaffold(
      appBar: const B2bAppBar(
        title: 'متجر الأسرة',
        subtitle: 'سوبر ماركت',
        icon: Icons.shopping_cart_outlined,
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(16.r),
          children: [
            Text(
              'الملف الشخصي',
              style: TextStyles.font22bold.copyWith(color: cs.onSurface),
            ),
            verticalSpace(4.h),
            Text(
              'معلومات الحساب والإعدادات',
              style: TextStyles.font14.copyWith(color: cs.onSurfaceVariant),
            ),
            verticalSpace(16.h),
            const SuperAccountHeaderCard(),
            verticalSpace(16.h),
            Row(
              children: [
                Expanded(
                  child: SuperAccountStatCard(
                    value: superAccountStats[0].value,
                    title: superAccountStats[0].title,
                    subtitle: superAccountStats[0].subtitle,
                    backgroundColor: cs.surface,
                    valueColor: cs.primary,
                    icon: Icons.shopping_bag_outlined,
                    iconColor: cs.primary,
                  ),
                ),
                horizontalSpace(10.w),
                Expanded(
                  child: SuperAccountStatCard(
                    value: superAccountStats[1].value,
                    title: superAccountStats[1].title,
                    subtitle: superAccountStats[1].subtitle,
                    backgroundColor: cs.surface,
                    valueColor: context.appColors.success,
                    icon: Icons.trending_up_rounded,
                    iconColor: context.appColors.success,
                  ),
                ),
                horizontalSpace(10.w),
                Expanded(
                  child: SuperAccountStatCard(
                    value: superAccountStats[2].value,
                    title: superAccountStats[2].title,
                    subtitle: superAccountStats[2].subtitle,
                    backgroundColor: cs.surface,
                    valueColor: context.appColors.warning,
                    icon: Icons.storefront_outlined,
                    iconColor: context.appColors.warning,
                  ),
                ),
              ],
            ),
            verticalSpace(16.h),
            const SuperAccountInfoSection(),
            verticalSpace(16.h),
            const SuperAccountActionGrid(),
            verticalSpace(16.h),
            const SuperAccountSettingsSection(),
          ],
        ),
      ),
    );
  }
}
