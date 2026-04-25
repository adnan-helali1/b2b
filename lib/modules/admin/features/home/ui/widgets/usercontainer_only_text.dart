import 'package:b2b/core/theme/app_colors.dart';
import 'package:b2b/core/theme/textstyles.dart';
import 'package:flutter/widgets.dart';
import 'package:b2b/core/theme/colors.dart';

class Usertextcontainer extends StatelessWidget {
  final String text;

   const Usertextcontainer({
    super.key,
    required this.text,});
     @override
   Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 30,
      decoration: BoxDecoration(
        color: AppColors.lightSurface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.neutral60.withOpacity(0.5),
          width: 2,
        ),
      ),
        child: Text(text,style: TextStyles.font12,textAlign: TextAlign.center),);
        
        }}
