// features/customers/logic/customers_state.dart
import 'package:equatable/equatable.dart';

class Customer extends Equatable {
  final String id;
  final String name;
  final String location;
  final double rating;
  final int ordersCount;
  final double totalAmount;
  final double paymentRate;
  final double pendingDues;
  final DateTime lastOrderDate;
  final bool isActive;

  const Customer({
    required this.id,
    required this.name,
    required this.location,
    required this.rating,
    required this.ordersCount,
    required this.totalAmount,
    required this.paymentRate,
    required this.pendingDues,
    required this.lastOrderDate,
    required this.isActive,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    location,
    rating,
    ordersCount,
    totalAmount,
    paymentRate,
    pendingDues,
    lastOrderDate,
    isActive,
  ];
}

class CustomersState extends Equatable {
  final bool isLoading;
  final List<Customer> customers;
  final int totalCustomers;
  final double totalSales;
  final double pendingDues;
  final double averageOrder;

  const CustomersState({
    required this.isLoading,
    required this.customers,
    required this.totalCustomers,
    required this.totalSales,
    required this.pendingDues,
    required this.averageOrder,
  });

  factory CustomersState.initial() => const CustomersState(
    isLoading: true,
    customers: [],
    totalCustomers: 0,
    totalSales: 0,
    pendingDues: 0,
    averageOrder: 0,
  );

  @override
  List<Object?> get props => [
    isLoading,
    customers,
    totalCustomers,
    totalSales,
    pendingDues,
    averageOrder,
  ];

  CustomersState copyWith({
    bool? isLoading,
    List<Customer>? customers,
    int? totalCustomers,
    double? totalSales,
    double? pendingDues,
    double? averageOrder,
  }) {
    return CustomersState(
      isLoading: isLoading ?? this.isLoading,
      customers: customers ?? this.customers,
      totalCustomers: totalCustomers ?? this.totalCustomers,
      totalSales: totalSales ?? this.totalSales,
      pendingDues: pendingDues ?? this.pendingDues,
      averageOrder: averageOrder ?? this.averageOrder,
    );
  }
}
