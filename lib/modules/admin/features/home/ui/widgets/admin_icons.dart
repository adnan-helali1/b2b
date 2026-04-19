import 'package:flutter/material.dart';

class AdminIcons extends StatelessWidget {
  final IconData icon;
  final Color iconcolor;
  final Color circulcolor;
  AdminIcons({
    required this.circulcolor,
    required this.icon,
    required this.iconcolor,
  });
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: circulcolor,
      radius: 30,
      child: Icon(icon, color: iconcolor, size: 25),
    );
  }
}
