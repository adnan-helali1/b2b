import 'package:b2b/core/helpers/spacing.dart';
import 'package:b2b/core/theme/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:b2b/core/theme/app_colors.dart';
import 'package:flutter/widgets.dart';
import 'package:b2b/modules/admin/features/home/ui/widgets/admin_home_big_container.dart';
import 'package:b2b/modules/admin/features/home/ui/widgets/homecountainer.dart';
 class Smallcircular extends StatelessWidget {
  final List<Color> colorcircle;
  final List<String> textnear;
  Smallcircular({
    super.key,
    required this.colorcircle,
    required this.textnear,
  });
  @override
   Widget build(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
         
          children: [
            CircleAvatar(
              radius: 10,
              backgroundColor: colorcircle[0],
              
            ),
            horizontalSpace(15),
            Text(textnear[0],style: TextStyles.font14,)
          ],
        ),
        verticalSpace(15),
         Row(
          children: [
            CircleAvatar(
              radius: 10,
              backgroundColor: colorcircle[1],
              
            ),
             horizontalSpace(20),
            Text(textnear[1],style: TextStyles.font14,)
          ],
        ),
        verticalSpace(15),
         Row(
          children: [
            CircleAvatar(
              radius: 10,
              backgroundColor: colorcircle[2],
              
            ),
             horizontalSpace(20),
            Text(textnear[2],style: TextStyles.font14,)
          ],
        ),
      ],
    );
   }
 }