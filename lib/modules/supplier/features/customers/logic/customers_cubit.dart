// features/customers/logic/customers_cubit.dart
import 'package:b2b/modules/supplier/features/customers/logic/customers_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomersCubit extends Cubit<CustomersState> {
  CustomersCubit() : super(CustomersState.initial());

  void loadCustomers() {
    // Dummy data
    final customers = <Customer>[
      Customer(
        id: '1',
        name: 'سوبرماركت الوطنية',
        location: 'الرياض، حي الخُبيل',
        rating: 4.8,
        ordersCount: 24,
        totalAmount: 45700,
        paymentRate: 95,
        pendingDues: 2480,
        lastOrderDate: DateTime(2026, 4, 5),
        isActive: true,
      ),
      Customer(
        id: '2',
        name: 'سوبرماركت الخير',
        location: 'جدة، حي الزهراء',
        rating: 4.5,
        ordersCount: 18,
        totalAmount: 32500,
        paymentRate: 89,
        pendingDues: 3450,
        lastOrderDate: DateTime(2026, 4, 4),
        isActive: true,
      ),
      Customer(
        id: '3',
        name: 'سوبرماركت النخبة',
        location: 'الدمام، حي الشاطئ',
        rating: 4.6,
        ordersCount: 30,
        totalAmount: 61200,
        paymentRate: 92,
        pendingDues: 1800,
        lastOrderDate: DateTime(2026, 4, 3),
        isActive: true,
      ),
      Customer(
        id: '4',
        name: 'سوبرماركت المدينة',
        location: 'المدينة، حي قباء',
        rating: 4.3,
        ordersCount: 15,
        totalAmount: 21000,
        paymentRate: 87,
        pendingDues: 5200,
        lastOrderDate: DateTime(2026, 4, 2),
        isActive: true,
      ),
      Customer(
        id: '5',
        name: 'سوبرماركت الروضة',
        location: 'الرياض، حي الروضة',
        rating: 4.7,
        ordersCount: 27,
        totalAmount: 48750,
        paymentRate: 93,
        pendingDues: 1600,
        lastOrderDate: DateTime(2026, 4, 1),
        isActive: true,
      ),
    ];

    final totalCustomers = customers.length;
    final totalSales = customers.fold<double>(
      0,
      (sum, c) => sum + c.totalAmount,
    );
    final pendingDues = customers.fold<double>(
      0,
      (sum, c) => sum + c.pendingDues,
    );
    final totalOrders = customers.fold<int>(
      0,
      (sum, c) => sum + c.ordersCount,
    );
    final averageOrder = totalOrders == 0
        ? 0
        : totalSales / totalOrders.toDouble();

    emit(
      state.copyWith(
        isLoading: false,
        customers: customers,
        totalCustomers: totalCustomers,
        totalSales: totalSales,
        pendingDues: pendingDues,

        //  averageOrder: averageOrder,
      ),
    );
  }
}
