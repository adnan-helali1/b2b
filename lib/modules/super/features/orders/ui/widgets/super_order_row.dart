import 'package:flutter/material.dart';

class SuperOrderRow extends StatelessWidget {
  const SuperOrderRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'طلباتي',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text('إدارة ومتابعة الطلبات', style: TextStyle(color: Colors.grey)),
          ],
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF2D4B9A),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text(
            'طلب جديد +',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
