// import 'package:b2b/modules/super/features/orders/data/super_order_model.dart';
// import 'package:b2b/modules/super/features/orders/logic/super_order_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class OrdersScreen extends StatelessWidget {
//   OrdersScreen({super.key});

//   final List<OrderModel> allOrders = [
//     OrderModel(
//       id: 'ORD-2024-001',
//       status: 'pending',
//       supplier: 'مزارع الخير',
//       date: '2024-03-24',
//       products: '5 منتجات',
//       price: '2450.00',
//     ),
//     OrderModel(
//       id: 'ORD-2024-002',
//       status: 'shipping',
//       supplier: 'الألبان الوطنية',
//       date: '2024-03-23',
//       products: '3 منتجات',
//       price: '1890.00',
//     ),
//     OrderModel(
//       id: 'ORD-2024-003',
//       status: 'delivered',
//       supplier: 'البقالة الممتازة',
//       date: '2024-03-22',
//       products: '8 منتجات',
//       price: '3120.00',
//     ),
//     OrderModel(
//       id: 'ORD-2024-004',
//       status: 'pending',
//       supplier: 'مزارع الخير',
//       date: '2024-03-21',
//       products: '4 منتجات',
//       price: '1650.00',
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => OrdersCubit(),
//       child: Scaffold(
//         backgroundColor: Colors.grey[100],

//         /// 🔹 AppBar (نفس التصميم)
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           elevation: 0,
//           title: const Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text('متجر الأسرة', style: TextStyle(fontSize: 16)),
//               Text(
//                 'سوبر ماركت',
//                 style: TextStyle(fontSize: 12, color: Colors.grey),
//               ),
//             ],
//           ),
//           actions: const [
//             Icon(Icons.nightlight_round),
//             SizedBox(width: 16),
//             Icon(Icons.logout, color: Colors.red),
//             SizedBox(width: 12),
//           ],
//         ),

//         body: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             children: [
//               /// 🔹 Title + Button
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'طلباتي',
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Text(
//                         'إدارة ومتابعة الطلبات',
//                         style: TextStyle(color: Colors.grey),
//                       ),
//                     ],
//                   ),
//                   ElevatedButton(
//                     onPressed: () {},
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color(0xFF2D4B9A),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                     child: const Text('طلب جديد +'),
//                   ),
//                 ],
//               ),

//               const SizedBox(height: 16),

//               /// 🔹 Tabs (Bloc)
//               BlocBuilder<OrdersCubit, OrdersState>(
//                 builder: (context, state) {
//                   return Row(
//                     children: [
//                       _tab(context, 'الكل', OrdersFilter.all, state),
//                       const SizedBox(width: 8),
//                       _tab(context, 'قيد التنفيذ', OrdersFilter.pending, state),
//                       const SizedBox(width: 8),
//                       _tab(context, 'مكتملة', OrdersFilter.delivered, state),
//                     ],
//                   );
//                 },
//               ),

//               const SizedBox(height: 16),

//               /// 🔥 Orders List + Animation
//               Expanded(
//                 child: BlocBuilder<OrdersCubit, OrdersState>(
//                   builder: (context, state) {
//                     final filtered = _filterOrders(allOrders, state.filter);

//                     return AnimatedSwitcher(
//                       duration: const Duration(milliseconds: 300),
//                       child: ListView.builder(
//                         key: ValueKey(state.filter),
//                         itemCount: filtered.length,
//                         itemBuilder: (context, index) {
//                           final order = filtered[index];

//                           return TweenAnimationBuilder(
//                             duration: Duration(
//                               milliseconds: 200 + (index * 50),
//                             ),
//                             tween: Tween<double>(begin: 0, end: 1),
//                             builder: (context, value, child) {
//                               return Opacity(
//                                 opacity: value,
//                                 child: Transform.translate(
//                                   offset: Offset(0, 10 * (1 - value)),
//                                   child: child,
//                                 ),
//                               );
//                             },
//                             child: _orderCard(order),
//                           );
//                         },
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   /// ================== FILTER ==================
//   List<OrderModel> _filterOrders(List<OrderModel> orders, OrdersFilter filter) {
//     if (filter == OrdersFilter.all) return orders;

//     if (filter == OrdersFilter.pending) {
//       return orders.where((o) => o.status != 'delivered').toList();
//     }

//     if (filter == OrdersFilter.delivered) {
//       return orders.where((o) => o.status == 'delivered').toList();
//     }

//     return orders;
//   }

//   /// ================== TAB ==================
//   Widget _tab(
//     BuildContext context,
//     String text,
//     OrdersFilter filter,
//     OrdersState state,
//   ) {
//     final isSelected = state.filter == filter;

//     return GestureDetector(
//       onTap: () => context.read<OrdersCubit>().changeFilter(filter),
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 250),
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//         decoration: BoxDecoration(
//           color: isSelected ? const Color(0xFF2D4B9A) : Colors.white,
//           borderRadius: BorderRadius.circular(12),
//           border: Border.all(color: Colors.grey.shade300),
//         ),
//         child: Text(
//           text,
//           style: TextStyle(color: isSelected ? Colors.white : Colors.black),
//         ),
//       ),
//     );
//   }

//   /// ================== ORDER CARD ==================
//   Widget _orderCard(OrderModel order) {
//     Color statusColor;
//     String statusText;

//     switch (order.status) {
//       case 'pending':
//         statusColor = Colors.orange;
//         statusText = 'قيد الانتظار';
//         break;
//       case 'shipping':
//         statusColor = Colors.purple;
//         statusText = 'تم الشحن';
//         break;
//       case 'delivered':
//         statusColor = Colors.green;
//         statusText = 'تم التسليم';
//         break;
//       default:
//         statusColor = Colors.blue;
//         statusText = 'قيد المعالجة';
//     }

//     return Container(
//       margin: const EdgeInsets.only(bottom: 12),
//       padding: const EdgeInsets.all(14),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         border: Border.all(color: Colors.grey.shade200),
//       ),
//       child: Column(
//         children: [
//           /// Top Row
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 order.id,
//                 style: const TextStyle(fontWeight: FontWeight.bold),
//               ),
//               Row(
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 10,
//                       vertical: 4,
//                     ),
//                     decoration: BoxDecoration(
//                       color: statusColor.withOpacity(0.15),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: Text(
//                       statusText,
//                       style: TextStyle(color: statusColor, fontSize: 12),
//                     ),
//                   ),
//                   const SizedBox(width: 6),
//                   const Icon(Icons.arrow_forward_ios, size: 14),
//                 ],
//               ),
//             ],
//           ),

//           const SizedBox(height: 10),

//           /// Supplier + Date
//           Row(
//             children: [
//               Text(order.supplier, style: const TextStyle(color: Colors.grey)),
//               const SizedBox(width: 10),
//               const Icon(Icons.calendar_today, size: 14, color: Colors.grey),
//               const SizedBox(width: 4),
//               Text(order.date, style: const TextStyle(color: Colors.grey)),
//             ],
//           ),

//           const SizedBox(height: 10),

//           /// Bottom Row
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(
//                 children: [
//                   const Icon(Icons.inventory_2, size: 18),
//                   const SizedBox(width: 4),
//                   Text(order.products),
//                 ],
//               ),
//               Text(
//                 '${order.price} ر.س',
//                 style: const TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xFF2D4B9A),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
