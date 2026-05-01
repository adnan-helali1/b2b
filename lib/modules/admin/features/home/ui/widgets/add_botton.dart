import 'package:flutter/material.dart';
import 'package:b2b/core/theme/app_colors.dart';

class AddBotton extends StatelessWidget {
  AddBotton({super.key});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.purpleCardDark,
        foregroundColor: AppColors.lightBackground,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        padding: EdgeInsets.all(10),
      ),
      child: Row(
        children: [Icon(Icons.person_add_alt, size: 20), Text('اضافة')],
      ),
    );
  }
}
