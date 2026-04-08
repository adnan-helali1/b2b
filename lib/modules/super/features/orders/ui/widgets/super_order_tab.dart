import 'package:b2b/modules/super/features/orders/logic/super_order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget superOrderTab(
  BuildContext context,
  String text,
  OrdersFilter filter,
  OrdersState state,
) {
  final isSelected = state.filter == filter;

  return GestureDetector(
    onTap: () => context.read<OrdersCubit>().changeFilter(filter),
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF2D4B9A) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Text(
        text,
        style: TextStyle(color: isSelected ? Colors.white : Colors.black),
      ),
    ),
  );
}
