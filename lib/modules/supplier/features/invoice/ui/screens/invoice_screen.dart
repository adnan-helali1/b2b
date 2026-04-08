// lib/modules/invoices/ui/screens/invoices_screen.dart
import 'package:b2b/modules/supplier/features/invoice/logic/cubit/invoice_cubit.dart';
import 'package:b2b/modules/supplier/features/invoice/ui/widgets/invoice_stats_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/invoice_filter_bar.dart';
import '../widgets/invoice_list.dart';

class InvoicesScreen extends StatelessWidget {
  const InvoicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => InvoicesCubit(),
      child: Scaffold(body: const _InvoicesBody()),
    );
  }
}

class _InvoicesBody extends StatelessWidget {
  const _InvoicesBody();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              color: cs.surface,
              child: const InvoicesStatsSection(),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ).copyWith(bottom: 8),
              child: const InvoiceFilterBar(),
            ),
          ),
          const InvoiceList(),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
        ],
      ),
    );
  }
}
