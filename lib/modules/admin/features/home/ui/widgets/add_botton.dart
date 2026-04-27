import 'package:flutter/material.dart';
import 'package:b2b/core/theme/app_colors.dart';
import 'package:flutter/widgets.dart';
class AddBotton extends StatelessWidget{
  final String textbottun;
  final IconData iconbottun;
  AddBotton({super.key,
  required this.iconbottun,
  required this.textbottun,
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){},
    style: ElevatedButton.styleFrom(fixedSize: Size(50, 20),
      backgroundColor: AppColors.purpleCardDark,
      foregroundColor: AppColors.lightBackground,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      padding: EdgeInsets.all(10)
    ),
     child:Row(
      children: [
        Icon(iconbottun,size: 20,),
        Text(textbottun,),
      ],
     )
      );
  }
  
}