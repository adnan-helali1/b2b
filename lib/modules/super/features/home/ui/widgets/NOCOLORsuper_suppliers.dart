import 'package:b2b/core/helpers/spacing.dart';
import 'package:b2b/core/theme/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 🏪 Supplier Card
Widget supplierCard({
  required String name,
  required String products,
  required String rating,
}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 10),
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: Colors.grey.shade200),
    ),
    child: Row(
      children: [
        /// Icon
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.view_in_ar_sharp, color: Color(0xff1C3B8A)),
        ),
        horizontalSpace(12.w),

        /// Name + Products
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: TextStyles.font16BlackBold),
              const SizedBox(height: 4),
              Text(
                products,
                style: TextStyles.font14.copyWith(color: Colors.grey),
              ),
            ],
          ),
        ),

        /// Rating
        Row(
          children: [
            Text(rating),
            horizontalSpace(4.w),
            const Icon(Icons.star, color: Colors.orange, size: 18),
          ],
        ),
      ],
    ),
  );
}
