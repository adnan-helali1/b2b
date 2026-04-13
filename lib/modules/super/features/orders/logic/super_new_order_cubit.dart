import 'package:b2b/modules/super/features/pos/data/super_pos_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuperNewOrderState {
  final int selectedFilterIndex;
  final Map<String, int> cartQuantities;
  final double totalAmount;

  const SuperNewOrderState({
    required this.selectedFilterIndex,
    required this.cartQuantities,
    required this.totalAmount,
  });

  factory SuperNewOrderState.initial() => const SuperNewOrderState(
    selectedFilterIndex: 0,
    cartQuantities: {},
    totalAmount: 0,
  );

  SuperNewOrderState copyWith({
    int? selectedFilterIndex,
    Map<String, int>? cartQuantities,
    double? totalAmount,
  }) {
    return SuperNewOrderState(
      selectedFilterIndex: selectedFilterIndex ?? this.selectedFilterIndex,
      cartQuantities: cartQuantities ?? this.cartQuantities,
      totalAmount: totalAmount ?? this.totalAmount,
    );
  }

  int get cartCount =>
      cartQuantities.values.fold(0, (sum, value) => sum + value);
}

class SuperNewOrderCubit extends Cubit<SuperNewOrderState> {
  SuperNewOrderCubit() : super(SuperNewOrderState.initial());

  final filters = const [
    'الكل',
    'بقالة الممتازة',
    'الألبان الوطنية',
    'مزارع الخير',
  ];

  List<SuperPosProduct> get visibleProducts {
    final filter = filters[state.selectedFilterIndex];
    if (filter == 'الكل') return superPosProducts;
    return superPosProducts
        .where((product) => product.supplier == filter)
        .toList();
  }

  void changeFilter(int index) {
    if (index == state.selectedFilterIndex) return;
    emit(state.copyWith(selectedFilterIndex: index));
  }

  void addProduct(SuperPosProduct product) {
    final currentCount = state.cartQuantities[product.name] ?? 0;
    final newCart = Map<String, int>.from(state.cartQuantities)
      ..[product.name] = currentCount + 1;

    emit(
      state.copyWith(
        cartQuantities: newCart,
        totalAmount: state.totalAmount + _parsePrice(product.price),
      ),
    );
  }

  int cartQuantityFor(String productName) =>
      state.cartQuantities[productName] ?? 0;

  double _parsePrice(String price) {
    final cleaned = price.replaceAll('ر.س', '').trim();
    return double.tryParse(cleaned) ?? 0;
  }
}
