import 'package:flutter_bloc/flutter_bloc.dart';

enum OrdersFilter { all, pending, shipping, delivered }

class OrdersState {
  final OrdersFilter filter;

  OrdersState(this.filter);
}

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersState(OrdersFilter.all));

  void changeFilter(OrdersFilter filter) {
    emit(OrdersState(filter));
  }
}
