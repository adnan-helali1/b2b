// features/orders/logic/orders_state.dart

import 'package:equatable/equatable.dart';

class OrderEntity extends Equatable {
  final String id;
  final String storeName;
  final int productsCount;
  final double totalPrice;
  final OrderStatus status;

  const OrderEntity({
    required this.id,
    required this.storeName,
    required this.productsCount,
    required this.totalPrice,
    required this.status,
  });

  @override
  List<Object?> get props => [id, storeName, productsCount, totalPrice, status];
}

enum OrdersFilter { all, newOrder, accepted, preparing, shipped }

class OrdersState extends Equatable {
  final List<OrderEntity> orders;
  final OrdersFilter selectedFilter;

  const OrdersState({required this.orders, required this.selectedFilter});

  List<OrderEntity> get filteredOrders {
    switch (selectedFilter) {
      case OrdersFilter.newOrder:
        return orders.where((e) => e.status == OrderStatus.newOrder).toList();
      case OrdersFilter.accepted:
        return orders.where((e) => e.status == OrderStatus.accepted).toList();
      case OrdersFilter.preparing:
        return orders.where((e) => e.status == OrderStatus.preparing).toList();
      case OrdersFilter.shipped:
        return orders.where((e) => e.status == OrderStatus.shipped).toList();
      case OrdersFilter.all:
      // ignore: unreachable_switch_default
      default:
        return orders;
    }
  }

  @override
  List<Object?> get props => [orders, selectedFilter];

  OrdersState copyWith({
    List<OrderEntity>? orders,
    OrdersFilter? selectedFilter,
  }) {
    return OrdersState(
      orders: orders ?? this.orders,
      selectedFilter: selectedFilter ?? this.selectedFilter,
    );
  }
}

enum OrderStatus { newOrder, accepted, preparing, shipped }
