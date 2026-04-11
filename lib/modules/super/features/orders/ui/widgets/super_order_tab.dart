import 'package:b2b/core/helpers/extensions.dart';
import 'package:b2b/core/theme/textstyles.dart';
import 'package:b2b/modules/super/features/orders/logic/super_order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget superOrderTab(
  BuildContext context,
  String text,
  OrdersFilter filter,
  OrdersState state,
) {
  final isSelected = state.filter == filter;
  final cs = context.cs;

  return GestureDetector(
    onTap: () => context.read<OrdersCubit>().changeFilter(filter),
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: isSelected ? cs.primary : cs.surface,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: context.appColors.borderColor),
      ),
      child: Text(
        text,
        style: TextStyles.font12w600.copyWith(
          color: isSelected ? cs.onPrimary : cs.onSurface,
        ),
      ),
    ),
  );
}
