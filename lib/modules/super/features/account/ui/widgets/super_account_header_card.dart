import 'package:b2b/core/helpers/extensions.dart';
import 'package:b2b/core/helpers/spacing.dart';
import 'package:b2b/core/theme/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuperAccountHeaderCard extends StatelessWidget {
  const SuperAccountHeaderCard({super.key});

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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 62.w,
            height: 62.w,
            decoration: BoxDecoration(
              color: cs.primary.withOpacity(0.10),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.store_outlined, color: cs.primary, size: 30.sp),
          ),
          horizontalSpace(12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'متجر الأسرة',
                            style: TextStyles.font18w700.copyWith(
                              color: cs.onSurface,
                            ),
                          ),
                          Text(
                            'مؤسسة الأسرة للتجارة',
                            style: TextStyles.font12normal.copyWith(
                              color: cs.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                    OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.edit_outlined, size: 18),
                      label: const Text('تعديل'),
                    ),
                  ],
                ),
                verticalSpace(10.h),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 4.h,
                  ),
                  decoration: BoxDecoration(
                    color: cs.primary.withOpacity(0.10),
                    borderRadius: BorderRadius.circular(999.r),
                  ),
                  child: Text(
                    'سوبر ماركت',
                    style: TextStyles.font12w600.copyWith(color: cs.primary),
                  ),
                ),
                verticalSpace(12.h),
                _ContactRow(
                  icon: Icons.email_outlined,
                  value: 'supermarket@family.com',
                ),
                verticalSpace(8.h),
                _ContactRow(
                  icon: Icons.phone_outlined,
                  value: '+966 50 234 5678',
                ),
                verticalSpace(8.h),
                _ContactRow(
                  icon: Icons.location_on_outlined,
                  value: 'الرياض، حي الزنبق، شارع الأمير سلطان',
                ),
                verticalSpace(8.h),
                _ContactRow(
                  icon: Icons.calendar_today_outlined,
                  value: 'عضو منذ 15-01-2024',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactRow extends StatelessWidget {
  final IconData icon;
  final String value;

  const _ContactRow({required this.icon, required this.value});

  @override
  Widget build(BuildContext context) {
    final cs = context.cs;

    return Row(
      children: [
        Icon(icon, size: 18, color: cs.onSurfaceVariant),
        horizontalSpace(8.w),
        Expanded(
          child: Text(
            value,
            style: TextStyles.font12normal.copyWith(color: cs.onSurface),
          ),
        ),
      ],
    );
  }
}
