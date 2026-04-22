// features/orders/ui/widgets/orders_filter_bar.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/orders_cubit.dart';
import '../../logic/orders_state.dart';

class OrdersFilterBar extends StatelessWidget {
  const OrdersFilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return BlocBuilder<OrdersCubit, OrdersState>(
      builder: (context, state) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: OrdersFilter.values.map((filter) {
              final isSelected =
                  state.selectedFilter == filter;

              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: GestureDetector(
                  onTap: () => context
                      .read<OrdersCubit>()
                      .changeFilter(filter),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Theme.of(
                              context,
                            ).colorScheme.primary
                          : Theme.of(
                              context,
                            ).colorScheme.surface,
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                      border: Border.all(
                        color: Theme.of(context)
                            .colorScheme
                            .outline
                            .withOpacity(0.2),
                      ),
                    ),
                    child: Text(
                      _label(filter),
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(
                            color: isSelected
                                ? cs.onPrimary
                                : cs.onSurface,
                          ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }

  String _label(OrdersFilter f) {
    switch (f) {
      case OrdersFilter.all:
        return 'الكل';
      case OrdersFilter.newOrder:
        return 'جديد';
      case OrdersFilter.accepted:
        return 'مقبول';
      case OrdersFilter.preparing:
        return 'قيد التحضير';
      case OrdersFilter.shipped:
        return 'تم الشحن';
    }
  }
}
