import 'package:b2b/core/helpers/extensions.dart';
import 'package:b2b/core/helpers/spacing.dart';
import 'package:b2b/core/theme/textstyles.dart';
import 'package:b2b/core/widgets/b2b_app_bar.dart';
import 'package:b2b/core/routing/routes.dart';
import 'package:b2b/modules/super/features/pos/data/super_pos_data.dart';
import 'package:b2b/modules/super/features/pos/ui/widgets/super_pos_bottom_nav.dart';
import 'package:b2b/modules/super/features/pos/ui/widgets/super_pos_product_card.dart';
import 'package:b2b/modules/super/features/pos/ui/widgets/super_pos_search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuperPosScreen extends StatefulWidget {
  const SuperPosScreen({super.key});

  @override
  State<SuperPosScreen> createState() => _SuperPosScreenState();
}

class _SuperPosScreenState extends State<SuperPosScreen> {
  int currentIndex = 4;

  @override
  Widget build(BuildContext context) {
    final cs = context.cs;

    return Scaffold(
      appBar: B2bAppBar(
        title: 'متجر الأسرة',
        subtitle: 'سوبر ماركت',
        icon: Icons.shopping_cart_outlined,
        actionIcon: Icons.person_outline,
        actionColor: cs.primary,
        onActionPressed: () =>
            Navigator.of(context).pushNamed(Routes.superAccountScreen),
      ),
      bottomNavigationBar: SuperPosBottomNav(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'نقطة البيع (POS)',
                style: TextStyles.font22bold.copyWith(color: cs.onSurface),
              ),
              verticalSpace(4.h),
              Text(
                'إدارة المبيعات المباشرة',
                style: TextStyles.font14.copyWith(color: cs.onSurfaceVariant),
              ),
              verticalSpace(12.h),
              const SuperPosSearchField(),
              verticalSpace(14.h),
              Text(
                'المنتجات المتاحة',
                style: TextStyles.font18w700.copyWith(color: cs.onSurface),
              ),
              verticalSpace(12.h),
              Expanded(
                child: GridView.builder(
                  itemCount: superPosProducts.length,
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12.w,
                    mainAxisSpacing: 12.h,
                    mainAxisExtent: 238.h,
                  ),
                  itemBuilder: (context, index) {
                    return SuperPosProductCard(
                      product: superPosProducts[index],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
