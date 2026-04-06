import 'package:b2b/core/theme/app_colors.dart';
import 'package:b2b/core/theme/textstyles.dart';
import 'package:flutter/widgets.dart';
import 'package:b2b/core/theme/app_color_scheme_extention.dart';
import 'package:b2b/core/theme/colors.dart';


class AdminHomeCountainer extends StatelessWidget {
  final IconData icon1;
  final String text1;
  final String text2;
  final IconData icon2;
  final String text3;
  final Color colorcont1;
  final Color coloricon1;
  
  const AdminHomeCountainer({
    super.key,
    required this.icon1,
    required this.text1,
    required this.text2,
    required this.icon2,
    required this.text3,
    required this.colorcont1,
    required this.coloricon1,
 
  });
  @override
  Widget build(BuildContext context){
    

    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(color:AppColors.lightSurface,borderRadius: BorderRadius.circular(10),border: Border.all(color: AppColors.neutral60.withOpacity(0.5),width: 2,)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(color: colorcont1,borderRadius: BorderRadius.circular(10),),
              child: Icon(icon1,color: coloricon1,size: 30,),
            ),
            Text(text1,style: TextStyles.font12,),
            Text(text2,style: TextStyles.font18Bold,),
            Row(
              children: [
                Icon(icon2,color:ColorsManegar.green,size: 10,),
                Text(text3,style: TextStyle(color: ColorsManegar.green,fontSize: 12,fontWeight:  FontWeight.bold, ),)
              ],
            ),
        
          ],
        ),
      ),
    );
  }
}