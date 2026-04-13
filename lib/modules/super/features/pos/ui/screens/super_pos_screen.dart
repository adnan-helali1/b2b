import 'package:b2b/core/helpers/spacing.dart';
import 'package:b2b/core/widgets/b2b_app_bar.dart';
import 'package:b2b/core/widgets/super_header_on_screen.dart';
import 'package:b2b/modules/super/features/pos/data/super_pos_data.dart';
import 'package:b2b/modules/super/features/pos/ui/widgets/super_pos_product_card.dart';
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
    return Scaffold(
      appBar: B2bAppBar(
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
              SuperHeaderOnScreen(
                smallLabel: 'إدارة المبيعات المباشرة',
                bigLabel: 'نقطة البيع ( POS )',
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
