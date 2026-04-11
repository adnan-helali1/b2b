import 'package:b2b/core/widgets/b2b_app_bar.dart';
import 'package:b2b/modules/super/features/invoice/logic/cubit/super_invoice_cubit.dart';
import 'package:b2b/modules/super/features/invoice/ui/widgets/super_invoice_filter_bar.dart';
import 'package:b2b/modules/super/features/invoice/ui/widgets/super_invoice_list.dart';
import 'package:b2b/modules/super/features/invoice/ui/widgets/super_invoice_stats_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuperInvoiceScreen extends StatelessWidget {
  const SuperInvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SuperInvoiceCubit(),
      child: Scaffold(
        appBar: const B2bAppBar(
          title: 'متجر الأسرة',
          subtitle: 'سوبر ماركت',
          icon: Icons.shopping_cart_outlined,
        ),
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(child: SuperInvoiceStatsSection()),
              const SliverToBoxAdapter(child: SizedBox(height: 8)),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: SuperInvoiceFilterBar(),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 8)),
              const SuperInvoiceList(),
              const SliverToBoxAdapter(child: SizedBox(height: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
