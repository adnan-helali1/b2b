import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavState {
  final int currentIndex;
  final int ordersCount;

  BottomNavState({required this.currentIndex, this.ordersCount = 0});

  BottomNavState copyWith({int? currentIndex, int? ordersCount}) {
    return BottomNavState(
      currentIndex: currentIndex ?? this.currentIndex,
      ordersCount: ordersCount ?? this.ordersCount,
    );
  }
}

class BottomNavCubit extends Cubit<BottomNavState> {
  BottomNavCubit() : super(BottomNavState(currentIndex: 0));

  void changeTab(int index) {
    emit(state.copyWith(currentIndex: index));
  }

  void updateOrdersCount(int count) {
    emit(state.copyWith(ordersCount: count));
  }
}
