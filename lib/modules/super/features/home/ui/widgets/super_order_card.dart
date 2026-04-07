import 'package:b2b/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget orderCard({
  required BuildContext context,
  required String id,
  required String price,
  required String date,
  required String status,
  required Color statusColor,
}) {
  final cs = Theme.of(context).colorScheme;

  return Container(
    margin: const EdgeInsets.only(bottom: 10),
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(
      color: cs.surface,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: cs.outline.withOpacity(0.2)),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// Left
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              id,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: cs.onSurface,
              ),
            ),
            verticalSpace(6.h),
            Text(date, style: TextStyle(color: cs.onSurfaceVariant)),
          ],
        ),

        /// Status
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: statusColor.withOpacity(0.15),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            status,
            style: TextStyle(
              color: statusColor,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        /// Price
        Text(
          price,
          style: TextStyle(fontWeight: FontWeight.bold, color: cs.onSurface),
        ),
      ],
    ),
  );
}
