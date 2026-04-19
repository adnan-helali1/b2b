import 'package:b2b/core/helpers/extensions.dart';
import 'package:b2b/core/theme/textstyles.dart';
import 'package:b2b/modules/super/features/invoice/logic/cubit/super_invoice_cubit.dart';
import 'package:b2b/modules/super/features/invoice/logic/cubit/super_invoice_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'super_invoice_item_card.dart';

class SuperInvoiceList extends StatelessWidget {
  const SuperInvoiceList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SuperInvoiceCubit, SuperInvoiceState>(
      builder: (context, state) {
        if (state.visibleInvoices.isEmpty) {
          return SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
              child: Center(
                child: Text(
                  'لا توجد فواتير مطابقة',
                  style: TextStyles.font14.copyWith(
                    color: context.cs.onSurfaceVariant,
                  ),
                ),
              ),
            ),
          );
        }

        return SliverList.builder(
          itemCount: state.visibleInvoices.length,
          itemBuilder: (context, index) {
            final invoice = state.visibleInvoices[index];
            return SuperInvoiceItemCard(invoice: invoice);
          },
        );
      },
    );
  }
}
