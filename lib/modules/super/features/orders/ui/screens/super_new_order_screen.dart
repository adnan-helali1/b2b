import 'package:b2b/core/helpers/extensions.dart';
import 'package:b2b/core/helpers/spacing.dart';
import 'package:b2b/core/theme/textstyles.dart';
import 'package:b2b/modules/super/features/orders/logic/super_new_order_cubit.dart';
import 'package:b2b/modules/super/features/orders/ui/widgets/super_new_order_cart_bar.dart';
import 'package:b2b/modules/super/features/orders/ui/widgets/super_new_order_filter_chip.dart';
import 'package:b2b/modules/super/features/pos/ui/widgets/super_pos_product_card.dart';
import 'package:b2b/modules/super/features/pos/ui/widgets/super_pos_search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuperNewOrderScreen extends StatelessWidget {
  const SuperNewOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = context.cs;

    return BlocProvider(
      create: (_) => SuperNewOrderCubit(),
      child: BlocBuilder<SuperNewOrderCubit, SuperNewOrderState>(
        builder: (context, state) {
          final cubit = context.read<SuperNewOrderCubit>();
          final visibleProducts = cubit.visibleProducts;

          return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: cs.surface,
              elevation: 0,
              leading: IconButton(
                onPressed: () => context.pop(),
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: cs.onSurface,
                ),
              ),
              title: Text(
                'طلب جديد',
                style: TextStyles.font18w700.copyWith(color: cs.onSurface),
              ),
            ),
            bottomNavigationBar: state.cartCount > 0
                ? SuperNewOrderCartBar(
                    itemsCount: state.cartCount,
                    totalAmount: state.totalAmount,
                    onTap: () {},
                  )
                : const SizedBox.shrink(),
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SuperPosSearchField(),
                    verticalSpace(14.h),
                    Text(
                      'اختر المورد',
                      style: TextStyles.font12w600.copyWith(
                        color: cs.onSurface,
                      ),
                    ),
                    verticalSpace(10.h),
                    SizedBox(
                      height: 42.h,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: cubit.filters.length,
                        separatorBuilder: (_, __) => horizontalSpace(8.w),
                        itemBuilder: (context, index) {
                          return SuperNewOrderFilterChip(
                            label: cubit.filters[index],
                            isSelected: index == state.selectedFilterIndex,
                            onTap: () => cubit.changeFilter(index),
                          );
                        },
                      ),
                    ),
                    verticalSpace(10.h),
                    Row(
                      children: [
                        Text(
                          'المنتجات المتاحة',
                          style: TextStyles.font14.copyWith(
                            color: cs.onSurface,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '(${visibleProducts.length})',
                          style: TextStyles.font12normal.copyWith(
                            color: cs.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(12.h),
                    Expanded(
                      child: GridView.builder(
                        itemCount: visibleProducts.length,
                        padding: EdgeInsets.only(bottom: 90.h),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12.w,
                          mainAxisSpacing: 12.h,
                          mainAxisExtent: 238.h,
                        ),
                        itemBuilder: (context, index) {
                          final product = visibleProducts[index];
                          return SuperPosProductCard(
                            product: product,
                            cartQuantity: cubit.cartQuantityFor(product.name),
                            onAdd: () => cubit.addProduct(product),
                          );
                        },
                      ),
                    ),
                    if (state.cartCount == 0) verticalSpace(4.h),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
