import 'package:b2b/core/helpers/extensions.dart';
import 'package:b2b/core/helpers/spacing.dart';
import 'package:b2b/core/theme/textstyles.dart';
import 'package:b2b/modules/super/features/invoice/logic/cubit/super_invoice_cubit.dart';
import 'package:b2b/modules/super/features/invoice/logic/cubit/super_invoice_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuperInvoiceFilterBar extends StatelessWidget {
  const SuperInvoiceFilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SuperInvoiceCubit, SuperInvoiceState>(
      builder: (context, state) {
        return Row(
          children: [
            _InvoiceFilterChip(
              label: 'فواتير المشتريات',
              isSelected: state.filter == SuperInvoiceFilter.purchases,
              onTap: () => context.read<SuperInvoiceCubit>().changeFilter(
                SuperInvoiceFilter.purchases,
              ),
            ),
            horizontalSpace(10.w),
            _InvoiceFilterChip(
              label: 'فواتير المبيعات',
              isSelected: state.filter == SuperInvoiceFilter.sales,
              onTap: () => context.read<SuperInvoiceCubit>().changeFilter(
                SuperInvoiceFilter.sales,
              ),
            ),
          ],
        );
      },
    );
  }
}

class _InvoiceFilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _InvoiceFilterChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(14.r),
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 11.h),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? context.cs.primary : context.cs.surface,
            borderRadius: BorderRadius.circular(14.r),
            boxShadow: [
              BoxShadow(
                color: context.cs.shadow.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
            border: Border.all(
              color: isSelected
                  ? context.cs.primary.withOpacity(0.15)
                  : context.appColors.borderColor,
            ),
          ),
          child: Text(
            label,
            style: TextStyles.font12w600.copyWith(
              color: isSelected ? context.cs.onPrimary : context.cs.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}
