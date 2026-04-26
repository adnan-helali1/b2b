// features/customers/ui/screens/customers_screen.dart
import 'package:b2b/core/helpers/spacing.dart';
import 'package:b2b/core/theme/app_color_scheme_extention.dart';
import 'package:b2b/core/widgets/super_header_on_screen.dart';
import 'package:b2b/modules/supplier/features/customers/logic/customers_cubit.dart';
import 'package:b2b/modules/supplier/features/customers/logic/customers_state.dart';
import 'package:b2b/modules/supplier/features/customers/ui/widgets/customer_card.dart';
import 'package:b2b/modules/supplier/features/customers/ui/widgets/customers_stats_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomersScreen extends StatelessWidget {
  const CustomersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final appColors = Theme.of(
      context,
    ).extension<AppColorScheme>();

    return BlocProvider(
      create: (_) => CustomersCubit()..loadCustomers(),
      child: Scaffold(
        backgroundColor: colorScheme.background,

        body: BlocBuilder<CustomersCubit, CustomersState>(
          builder: (context, state) {
            if (state.isLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: colorScheme.primary,
                ),
              );
            }

            final customers = state.customers;

            return ListView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              itemCount: customers.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      SuperHeaderOnScreen(
                        bigLabel: 'العملاء',
                        smallLabel:
                            'إدارة قاعدة عملاء السوبرماركت',
                      ),
                      verticalSpace(10),
                      CustomerStatsGrid(
                        totalCustomers:
                            state.totalCustomers,
                        totalSales: state.totalSales,
                        pendingDues: state.pendingDues,
                        averageOrder: state.averageOrder,
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          Text(
                            'قائمة العملاء',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  fontWeight:
                                      FontWeight.w600,
                                  color: colorScheme
                                      .onBackground,
                                ),
                          ),
                          const Spacer(),
                          Container(
                            padding:
                                const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                            decoration: BoxDecoration(
                              color:
                                  (appColors?.borderColor ??
                                          colorScheme
                                              .surfaceVariant)
                                      .withOpacity(0.7),
                              borderRadius:
                                  BorderRadius.circular(
                                    999,
                                  ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.filter_list_rounded,
                                  size: 18,
                                  color:
                                      colorScheme.primary,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  'تصفية',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: colorScheme
                                            .onSurface,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                    ],
                  );
                }

                final customer = customers[index - 1];
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: index == customers.length
                        ? 16
                        : 12,
                  ),
                  child: CustomerCard(customer: customer),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
