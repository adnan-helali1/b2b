import 'package:b2b/core/helpers/spacing.dart';
import 'package:flutter/material.dart';

import '../../data/product_model.dart';

class ProductItemCard extends StatelessWidget {
  final ProductModel product;

  const ProductItemCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(14),
      margin: const EdgeInsets.symmetric(
        vertical: 6,
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        color: cs.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: cs.shadow),
        boxShadow: [
          BoxShadow(
            color: cs.shadow.withOpacity(0.05),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔥 IMAGE
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              width: 90,
              height: 90,
              child: Image.asset(
                product.image,
                fit: BoxFit.cover, // 🔥 مهم جداً
              ),
            ),
          ),

          horizontalSpace(12),
          // 🔥 CONTENT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: cs.onSurface,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "${product.category}",
                  style: TextStyle(
                    color: cs.onSurfaceVariant,
                  ),
                ),
                verticalSpace(4),
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "السعر\n${product.price} \$",
                      style: TextStyle(
                        color: cs.onSurfaceVariant,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      "المخزون\n${product.stock}",
                      style: TextStyle(
                        color: cs.onSurfaceVariant,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      "المبيعات\n${product.sales}",
                      style: TextStyle(
                        color: cs.onSurfaceVariant,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                verticalSpace(6),
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 62,
                          vertical: 8,
                        ),

                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: cs.primary,
                          ),
                          borderRadius:
                              BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        "تعديل",
                        style: TextStyle(
                          color: cs.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(10),
                          border: Border.all(
                            color: cs.error,
                          ),
                        ),
                        child: Icon(
                          Icons.delete_outline,
                          size: 20,
                          color: cs.error,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
