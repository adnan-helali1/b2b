import 'package:b2b/core/helpers/extensions.dart';
import 'package:b2b/core/helpers/spacing.dart';
import 'package:b2b/core/theme/textstyles.dart';
import 'package:b2b/core/widgets/b2b_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuperPosCartScreen extends StatelessWidget {
  const SuperPosCartScreen({super.key});

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
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'سلة البيع',
                style: TextStyles.font22bold.copyWith(color: cs.onSurface),
              ),
              verticalSpace(4.h),
              Text(
                'المنتجات المختارة للمراجعة قبل الإتمام',
                style: TextStyles.font14.copyWith(color: cs.onSurfaceVariant),
              ),
              verticalSpace(16.h),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16.r),
                  decoration: BoxDecoration(
                    color: cs.surface,
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(color: context.appColors.borderColor),
                  ),
                  child: Center(
                    child: Text(
                      'لا توجد منتجات مضافة بعد',
                      style: TextStyles.font14.copyWith(
                        color: cs.onSurfaceVariant,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
