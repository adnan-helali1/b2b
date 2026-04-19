import 'package:b2b/core/helpers/extensions.dart';
import 'package:b2b/core/helpers/spacing.dart';
import 'package:b2b/core/theme/textstyles.dart';
import 'package:b2b/core/widgets/b2b_app_bar.dart';
import 'package:b2b/modules/auth/features/account/ui/widgets/super_account_action_grid.dart';
import 'package:b2b/modules/auth/features/account/ui/widgets/super_account_header_card.dart';
import 'package:b2b/modules/auth/features/account/ui/widgets/super_account_info_section.dart';
import 'package:b2b/modules/auth/features/account/ui/widgets/super_account_settings_section.dart';
import 'package:b2b/modules/auth/features/account/ui/widgets/super_account_stat_card.dart';
import 'package:b2b/modules/auth/shared/auth_supabase_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/super_account_data.dart';

class SuperAccountScreen extends StatefulWidget {
  const SuperAccountScreen({super.key});

  @override
  State<SuperAccountScreen> createState() => _SuperAccountScreenState();
}

class _SuperAccountScreenState extends State<SuperAccountScreen> {
  late Future<UserProfile> _userProfileFuture;

  @override
  void initState() {
    super.initState();
    _userProfileFuture = AuthSupabaseService.instance.getCurrentUserProfile();
  }

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
        child: FutureBuilder<UserProfile>(
          future: _userProfileFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error_outline, size: 48.sp, color: Colors.red),
                    verticalSpace(16.h),
                    Text(
                      'خطأ في تحميل البيانات',
                      style: TextStyles.font18w700.copyWith(
                        color: cs.onSurface,
                      ),
                    ),
                    verticalSpace(8.h),
                    Text(
                      snapshot.error.toString(),
                      style: TextStyles.font14.copyWith(
                        color: cs.onSurfaceVariant,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            }

            final userProfile = snapshot.data;
            if (userProfile == null) {
              return Center(
                child: Text(
                  'لم يتم العثور على بيانات المستخدم',
                  style: TextStyles.font18w700.copyWith(color: cs.onSurface),
                ),
              );
            }

            return ListView(
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
                SuperAccountHeaderCard(userProfile: userProfile),
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
                SuperAccountInfoSection(userProfile: userProfile),
                verticalSpace(16.h),
                const SuperAccountActionGrid(),
                verticalSpace(16.h),
                const SuperAccountSettingsSection(),
              ],
            );
          },
        ),
      ),
    );
  }
}
