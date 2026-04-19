import 'package:flutter/material.dart';

class AuthContainer extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final VoidCallback onTap;
  final bool isSelected;

  const AuthContainer({
    super.key,
    required this.icon,
    required this.text,
    required this.color,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: isSelected ? color.withOpacity(0.12) : cs.surface,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isSelected ? color : cs.outline.withOpacity(0.3),
            width: isSelected ? 1.6 : 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color),
            const SizedBox(height: 10),
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: cs.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
