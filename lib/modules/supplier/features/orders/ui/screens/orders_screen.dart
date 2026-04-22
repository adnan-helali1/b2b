// features/orders/ui/screens/orders_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/orders_cubit.dart';
import '../../logic/orders_state.dart';
import '../widgets/order_card.dart';
import '../widgets/orders_filter_bar.dart';
import '../widgets/orders_stats_row.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return BlocProvider(
      create: (_) => OrdersCubit(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: scheme.surface,

          body: BlocBuilder<OrdersCubit, OrdersState>(
            builder: (context, state) {
              return ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  Text(
                    'الطلبات',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'إدارة طلبات المتاجر',
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 16),
                  OrdersStatsRow(orders: state.orders),
                  const SizedBox(height: 16),
                  const OrdersFilterBar(),
                  const SizedBox(height: 16),
                  ...state.filteredOrders.map(
                    (order) => Padding(
                      padding: const EdgeInsets.only(
                        bottom: 12,
                      ),
                      child: OrderCard(order: order),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
