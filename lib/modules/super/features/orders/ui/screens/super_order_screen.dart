import 'package:b2b/core/helpers/spacing.dart';
import 'package:b2b/core/widgets/b2b_app_bar.dart';
import 'package:b2b/modules/super/features/orders/logic/super_order_cubit.dart';
import 'package:b2b/modules/super/features/orders/ui/widgets/super_order_bloc_builder.dart';
import 'package:b2b/modules/super/features/orders/ui/widgets/super_order_row.dart';
import 'package:b2b/modules/super/features/orders/ui/widgets/super_order_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuperOrderScreen extends StatefulWidget {
  SuperOrderScreen({super.key});

  @override
  State<SuperOrderScreen> createState() => _SuperOrderScreenState();
}

class _SuperOrderScreenState extends State<SuperOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OrdersCubit(),
      child: Scaffold(
        appBar: B2bAppBar(
          title: 'متجر الأسرة',
          subtitle: 'سوبر ماركت',
          icon: Icons.shopping_cart_outlined,
        ),
        backgroundColor: Colors.grey[100],
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // 🔹 Title + Button
              SuperOrderRow(),

              verticalSpace(16.h),

              /// 🔹 Tabs
              BlocBuilder<OrdersCubit, OrdersState>(
                builder: (context, state) {
                  return Row(
                    children: [
                      superOrderTab(context, 'الكل', OrdersFilter.all, state),
                      const SizedBox(width: 8),
                      superOrderTab(
                        context,
                        'قيد التنفيذ',
                        OrdersFilter.pending,
                        state,
                      ),
                      const SizedBox(width: 8),
                      superOrderTab(
                        context,
                        'مكتملة',
                        OrdersFilter.delivered,
                        state,
                      ),
                    ],
                  );
                },
              ),
              verticalSpace(16.h),

              /// 🔹 Orders List
              SuperOrderBlocBuilder(),
            ],
          ),
        ),
      ),
    );
  }

  /// ================== TAB ==================
}
