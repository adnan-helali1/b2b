import 'package:b2b/modules/super/features/orders/data/super_order_model.dart';
import 'package:b2b/modules/super/features/orders/logic/super_order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersScreen extends StatefulWidget {
  OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  String? expandedOrderId; // ← تم تعريف المتغير هنا

  final List<OrderModel> allOrders = [
    OrderModel(
      id: 'ORD-2024-001',
      status: 'pending',
      supplier: 'مزارع الخير',
      date: '2024-03-24',
      products: '5 منتجات',
      price: '2450.00',
    ),
    OrderModel(
      id: 'ORD-2024-002',
      status: 'shipping',
      supplier: 'الألبان الوطنية',
      date: '2024-03-23',
      products: '3 منتجات',
      price: '1890.00',
    ),
    OrderModel(
      id: 'ORD-2024-003',
      status: 'delivered',
      supplier: 'البقالة الممتازة',
      date: '2024-03-22',
      products: '8 منتجات',
      price: '3120.00',
    ),
    OrderModel(
      id: 'ORD-2024-004',
      status: 'pending',
      supplier: 'مزارع الخير',
      date: '2024-03-21',
      products: '4 منتجات',
      price: '1650.00',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OrdersCubit(),
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              /// 🔹 Tabs
              BlocBuilder<OrdersCubit, OrdersState>(
                builder: (context, state) {
                  return Row(
                    children: [
                      _tab(context, 'الكل', OrdersFilter.all, state),
                      const SizedBox(width: 8),
                      _tab(context, 'قيد التنفيذ', OrdersFilter.pending, state),
                      const SizedBox(width: 8),
                      _tab(context, 'مكتملة', OrdersFilter.delivered, state),
                    ],
                  );
                },
              ),
              const SizedBox(height: 16),

              /// 🔹 Orders List
              Expanded(
                child: BlocBuilder<OrdersCubit, OrdersState>(
                  builder: (context, state) {
                    final filtered = _filterOrders(allOrders, state.filter);

                    return ListView.builder(
                      itemCount: filtered.length,
                      itemBuilder: (context, index) {
                        final order = filtered[index];
                        final isExpanded = order.id == expandedOrderId;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              expandedOrderId = isExpanded ? null : order.id;
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            margin: const EdgeInsets.only(bottom: 12),
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: isExpanded
                                  ? [
                                      BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 10,
                                      ),
                                    ]
                                  : [],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /// Top Row (ID + Status)
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      order.id,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    _statusWidget(order.status),
                                  ],
                                ),

                                const SizedBox(height: 8),

                                /// Supplier + Date
                                Row(
                                  children: [
                                    Text(
                                      order.supplier,
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    const Icon(
                                      Icons.calendar_today,
                                      size: 14,
                                      color: Colors.grey,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      order.date,
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 8),

                                /// Products + Price (Always visible)
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(Icons.inventory_2, size: 18),
                                        const SizedBox(width: 4),
                                        Text(order.products),
                                      ],
                                    ),
                                    Text(
                                      '${order.price} ر.س',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF2D4B9A),
                                      ),
                                    ),
                                  ],
                                ),

                                /// 🔹 Expanded Details
                                if (isExpanded) ...[
                                  const Divider(height: 20, color: Colors.grey),
                                  Text(
                                    'تفاصيل إضافية عن الطلب...',
                                    style: TextStyle(color: Colors.grey[700]),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'مثال: عنوان الشحن، طريقة الدفع، ملاحظات العميل',
                                    style: TextStyle(color: Colors.grey[700]),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _statusWidget(String status) {
    Color color;
    String text;

    switch (status) {
      case 'pending':
        color = Colors.orange;
        text = 'قيد الانتظار';
        break;
      case 'shipping':
        color = Colors.purple;
        text = 'تم الشحن';
        break;
      case 'delivered':
        color = Colors.green;
        text = 'تم التسليم';
        break;
      default:
        color = Colors.blue;
        text = 'قيد المعالجة';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(text, style: TextStyle(color: color)),
    );
  }

  /// ================== FILTER ==================
  List<OrderModel> _filterOrders(List<OrderModel> orders, OrdersFilter filter) {
    if (filter == OrdersFilter.all) return orders;
    if (filter == OrdersFilter.pending)
      return orders.where((o) => o.status != 'delivered').toList();
    if (filter == OrdersFilter.delivered)
      return orders.where((o) => o.status == 'delivered').toList();
    return orders;
  }

  /// ================== TAB ==================
  Widget _tab(
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
}
