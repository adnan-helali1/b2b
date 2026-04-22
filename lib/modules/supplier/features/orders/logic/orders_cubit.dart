// features/orders/logic/orders_cubit.dart

import 'package:flutter_bloc/flutter_bloc.dart';

import 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  static final List<OrderEntity> _dummyOrders = [
    OrderEntity(
      id: 'ORD-2024-001',
      storeName: 'متجر الأسرة',
      productsCount: 5,
      totalPrice: 2450,
      status: OrderStatus.newOrder,
    ),
    OrderEntity(
      id: 'ORD-2024-002',
      storeName: 'سوبر ماركت السعادة',
      productsCount: 8,
      totalPrice: 3890,
      status: OrderStatus.accepted,
    ),
    OrderEntity(
      id: 'ORD-2024-003',
      storeName: 'متجر النخبة',
      productsCount: 12,
      totalPrice: 5120,
      status: OrderStatus.preparing,
    ),
    OrderEntity(
      id: 'ORD-2024-004',
      storeName: 'متجر المدينة',
      productsCount: 6,
      totalPrice: 2760,
      status: OrderStatus.shipped,
    ),
  ];

  OrdersCubit()
    : super(
        OrdersState(
          orders: _dummyOrders,
          selectedFilter: OrdersFilter.all,
        ),
      );

  void changeFilter(OrdersFilter filter) {
    emit(state.copyWith(selectedFilter: filter));
  }
}
