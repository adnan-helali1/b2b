import 'dart:ffi';

import 'package:b2b/core/theme/app_colors.dart';
import 'package:b2b/core/theme/textstyles.dart';
import 'package:flutter/widgets.dart';
import 'package:b2b/core/theme/colors.dart';

class Usercontainers extends StatelessWidget {
  final IconData ?icon1;
  final String text1;
  final Color ?coloricon1;
  final double width;
  final double height;


  const Usercontainers({
    super.key,
    required this.icon1,
    required this.text1,
    required this.coloricon1,
    required this.height,
    required this.width,
     });
  @override
   Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.lightSurface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.neutral60.withOpacity(0.5),
          width: 2,
        ),
      ),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
        Icon(icon1??null, color: coloricon1??null, size: 40,),
            
            Text(text1, style: TextStyles.font12,),
          ]));}}