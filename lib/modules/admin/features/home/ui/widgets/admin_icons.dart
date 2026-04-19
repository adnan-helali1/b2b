import 'package:flutter/material.dart';
import 'package:b2b/core/theme/app_colors.dart';
import 'package:flutter/widgets.dart';
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
      child: Icon(
        icon,
        color: iconcolor,
        size: 25,
      ),
    );
  }
 }