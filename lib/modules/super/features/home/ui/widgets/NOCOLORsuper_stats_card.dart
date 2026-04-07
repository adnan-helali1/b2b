import 'package:flutter/material.dart';

Widget orderCard({
  required String id,
  required String price,
  required String date,
  required String status,
  required Color statusColor,
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// Left
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(id, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Text(date, style: const TextStyle(color: Colors.grey)),
          ],
        ),

        /// Center (Status)
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: statusColor.withOpacity(0.15),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            status,
            style: TextStyle(color: statusColor, fontSize: 12),
          ),
        ),

        /// Right (Price)
        Text(price, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    ),
  );
}
