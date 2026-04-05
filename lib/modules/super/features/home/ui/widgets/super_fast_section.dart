import 'package:b2b/core/helpers/spacing.dart';
import 'package:b2b/core/theme/app_color_scheme_extention.dart';
import 'package:b2b/core/theme/textstyles.dart';
import 'package:b2b/modules/super/features/home/ui/widgets/sections_fast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuickActionsSection extends StatelessWidget {
  const QuickActionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final ext = Theme.of(
      context,
    ).extension<AppColorScheme>()!;
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [cs.primary, cs.secondary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'إجراءات سريعة',
            style: TextStyles.font16w700,
          ),
          verticalSpace(16.h),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                child: QuickActionItem(
                  icon: Icons.inventory_2_outlined,
                  label: 'المخزون',
                ),
              ),
              horizontalSpace(10.w),
              const Expanded(
                child: QuickActionItem(
                  icon: Icons.receipt_long_outlined,
                  label: 'طلباتي',
                ),
              ),
              horizontalSpace(10.w),
              const Expanded(
                child: QuickActionItem(
                  icon: Icons.add_box_outlined,
                  label: 'طلب جديد',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
