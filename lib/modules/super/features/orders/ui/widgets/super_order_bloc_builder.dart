import 'package:b2b/core/helpers/extensions.dart';
import 'package:b2b/modules/super/features/orders/data/super_order_model.dart';
import 'package:b2b/modules/super/features/orders/logic/super_order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'super_order_card.dart';

class SuperOrderBlocBuilder extends StatefulWidget {
  const SuperOrderBlocBuilder({super.key});

  @override
  State<SuperOrderBlocBuilder> createState() => _SuperOrderBlocBuilderState();
}

class _SuperOrderBlocBuilderState extends State<SuperOrderBlocBuilder> {
  String? expandedOrderId;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<OrdersCubit, OrdersState>(
        builder: (context, state) {
          final filteredOrders = _filterOrders(allOrders, state.filter);

          if (filteredOrders.isEmpty) {
            return Center(
              child: Text(
                'لا توجد طلبات مطابقة',
                style: TextStyle(color: context.cs.onSurfaceVariant),
              ),
            );
          }

          return ListView.builder(
            padding: EdgeInsets.only(bottom: 16.h),
            itemCount: filteredOrders.length,
            itemBuilder: (context, index) {
              final order = filteredOrders[index];
              final isExpanded = expandedOrderId == order.id;

              return SuperOrderCard(
                order: order,
                isExpanded: isExpanded,
                onTap: () {
                  setState(() {
                    expandedOrderId = isExpanded ? null : order.id;
                  });
                },
              );
            },
          );
        },
      ),
    );
  }

  List<OrderModel> _filterOrders(List<OrderModel> orders, OrdersFilter filter) {
    switch (filter) {
      case OrdersFilter.all:
        return orders;
      case OrdersFilter.pending:
        return orders.where((order) => order.status == 'pending').toList();
      case OrdersFilter.shipping:
        return orders.where((order) => order.status == 'shipping').toList();
      case OrdersFilter.delivered:
        return orders.where((order) => order.status == 'delivered').toList();
    }
  }
}
