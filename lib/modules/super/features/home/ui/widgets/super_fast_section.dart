import 'package:b2b/modules/super/features/home/ui/widgets/sections_fast.dart';
import 'package:flutter/material.dart';

class QuickActionsSection extends StatelessWidget {
  const QuickActionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [Color(0xFF2F4FA2), Color(0xFF4A7BE5)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'إجراءات سريعة',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: QuickActionItem(
                  icon: Icons.inventory_2_outlined,
                  label: 'المخزون',
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: QuickActionItem(
                  icon: Icons.receipt_long_outlined,
                  label: 'طلباتي',
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: QuickActionItem(
                  icon: Icons.add_box_outlined,
                  label: 'طلب جديد',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
