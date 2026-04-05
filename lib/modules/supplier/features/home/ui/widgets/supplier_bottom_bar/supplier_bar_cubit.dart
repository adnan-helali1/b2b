import 'package:flutter_bloc/flutter_bloc.dart';

class SupplierBarCubit extends Cubit<SupplierBarState> {
  SupplierBarCubit()
    : super(SupplierBarState(currentIndex: 0));

  void changeTab(int index) {
    emit(state.copyWith(currentIndex: index));
  }

  void updateOrdersCount(int count) {
    emit(state.copyWith(ordersCount: count));
  }
}

class SupplierBarState {
  final int currentIndex;
  final int ordersCount;

  SupplierBarState({
    required this.currentIndex,
    this.ordersCount = 0,
  });

  SupplierBarState copyWith({
    int? currentIndex,
    int? ordersCount,
  }) {
    return SupplierBarState(
      currentIndex: currentIndex ?? this.currentIndex,
      ordersCount: ordersCount ?? this.ordersCount,
    );
  }
}
