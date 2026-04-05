import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/product_model.dart';
import '../data/products_data.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit()
    : super(
        ProductsState(
          selectedCategory: "الكل",
          filtered: products,
        ),
      );

  void filter(String category) {
    if (category == "الكل") {
      emit(
        state.copyWith(
          selectedCategory: category,
          filtered: products,
        ),
      );
    } else {
      emit(
        state.copyWith(
          selectedCategory: category,
          filtered: products
              .where((p) => p.category == category)
              .toList(),
        ),
      );
    }
  }
}

class ProductsState {
  final String selectedCategory;
  final List<ProductModel> filtered;

  ProductsState({
    required this.selectedCategory,
    required this.filtered,
  });

  ProductsState copyWith({
    String? selectedCategory,
    List<ProductModel>? filtered,
  }) {
    return ProductsState(
      selectedCategory:
          selectedCategory ?? this.selectedCategory,
      filtered: filtered ?? this.filtered,
    );
  }
}
