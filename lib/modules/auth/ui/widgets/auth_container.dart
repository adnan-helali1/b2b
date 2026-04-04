import 'package:flutter/material.dart';

class AuthContainer extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;

  const AuthContainer({
    super.key,
    required this.icon,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: cs.surface,
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: cs.outline.withOpacity(0.3)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(icon: Icon(icon), color: color, onPressed: () {}),
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
    );
  }
}
