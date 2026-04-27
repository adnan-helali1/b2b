import 'package:flutter/material.dart';
import 'package:b2b/core/theme/app_colors.dart';
import 'package:flutter/widgets.dart';
import 'package:b2b/core/theme/textstyles.dart';

class UserScreenContainer extends StatelessWidget {
final String text;
final Color containercolor;
  UserScreenContainer({super.key,
  required this.text,
  required this.containercolor,
  });
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 50,
      height: 30,
      decoration: BoxDecoration(
        color: containercolor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.neutral60.withOpacity(0.5),
          width: 2,
        )),
        child: Text(text,style: TextStyles.font12w600,textAlign: TextAlign.center,),
        );
  }
}