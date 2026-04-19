import 'package:b2b/core/helpers/extensions.dart';
import 'package:b2b/core/helpers/spacing.dart';
import 'package:b2b/core/theme/textstyles.dart';
import 'package:b2b/modules/auth/features/account/data/super_account_data.dart';
import 'package:b2b/modules/auth/shared/auth_supabase_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuperAccountInfoSection extends StatelessWidget {
  final UserProfile userProfile;

  const SuperAccountInfoSection({super.key, required this.userProfile});

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
            'معلومات النشاط التجاري',
            style: TextStyles.font18w700.copyWith(color: cs.onSurface),
          ),
          verticalSpace(12.h),
          _InfoRow(label: 'البريد الإلكتروني', value: userProfile.email),
          _InfoRow(label: 'رقم الهاتف', value: userProfile.phone),
          if (userProfile.address != null && userProfile.address != '-')
            _InfoRow(label: 'العنوان', value: userProfile.address!),
          if (userProfile.companyName != null &&
              userProfile.companyName!.isNotEmpty)
            _InfoRow(label: 'اسم الشركة', value: userProfile.companyName!),
          _InfoRow(
            label: 'نوع الحساب',
            value: userProfile.role == 'supermarket' ? 'سوبر ماركت' : 'موزع',
          ),
          ...superAccountBusinessInfo
              .where((item) => item.label != 'البريد الإلكتروني')
              .map((item) => _InfoRow(label: item.label, value: item.value)),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final cs = context.cs;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: cs.outlineVariant.withOpacity(0.5)),
        ),
      ),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyles.font12normal.copyWith(color: cs.onSurfaceVariant),
          ),
          const Spacer(),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: TextStyles.font12w600.copyWith(color: cs.onSurface),
            ),
          ),
        ],
      ),
    );
  }
}
