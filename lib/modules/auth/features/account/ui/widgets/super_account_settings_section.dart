import 'package:b2b/core/helpers/extensions.dart';
import 'package:b2b/core/helpers/spacing.dart';
import 'package:b2b/core/theme/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuperAccountSettingsSection extends StatelessWidget {
  const SuperAccountSettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = context.cs;

    return Container(
      padding: EdgeInsets.all(14.r),
      decoration: BoxDecoration(
        color: cs.surface,
        borderRadius: BorderRadius.circular(18.r),
        border: Border.all(color: context.appColors.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'الإعدادات',
            style: TextStyles.font18w700.copyWith(color: cs.onSurface),
          ),
          verticalSpace(12.h),
          _SettingItem(title: 'تغيير كلمة المرور', icon: Icons.lock_outline),
          _SettingItem(
            title: 'إعدادات الإشعارات',
            icon: Icons.notifications_none,
          ),
          _SettingItem(title: 'المساعدة والدعم', icon: Icons.support_agent),
          _SettingItem(
            title: 'سياسة الخصوصية',
            icon: Icons.privacy_tip_outlined,
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 12.h),
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                foregroundColor: cs.error,
                side: BorderSide(color: cs.error.withOpacity(0.35)),
                padding: EdgeInsets.symmetric(vertical: 12.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.r),
                ),
              ),
              child: const Text('تسجيل الخروج'),
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingItem extends StatelessWidget {
  final String title;
  final IconData icon;

  const _SettingItem({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    final cs = context.cs;

    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: cs.surfaceContainerHighest.withOpacity(0.35),
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: context.appColors.borderColor),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: cs.onSurfaceVariant),
          horizontalSpace(10.w),
          Expanded(
            child: Text(
              title,
              style: TextStyles.font12w600.copyWith(color: cs.onSurface),
            ),
          ),
          Icon(Icons.chevron_right, color: cs.onSurfaceVariant),
        ],
      ),
    );
  }
}
