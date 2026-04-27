import 'package:b2b/core/helpers/spacing.dart';
import 'package:b2b/modules/admin/features/home/ui/widgets/admin_home_big_container.dart';
import 'package:b2b/modules/admin/features/home/ui/widgets/admin_icons.dart';
import 'package:b2b/modules/admin/features/home/ui/widgets/user_screen_container.dart';
import 'package:b2b/modules/super/features/home/data/data.dart';
import 'package:flutter/material.dart';
import 'package:b2b/core/theme/app_colors.dart';
import 'package:b2b/core/theme/textstyles.dart';

class CategoriesList extends StatelessWidget{
final List<Map<String, dynamic>> categories;
 CategoriesList({
  super.key,
  required this.categories,
 });
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final item = categories[index];
        return BigContainer(
           height: 180, width: double.infinity,
          children: [
          
                Row(
                  children: [
                    Image.network(item['image'],
                    width: 50,height: 50,
                    fit: BoxFit.cover,),
                 
                horizontalSpace(20),
                Row(
                  children: [
                    Column( crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item['categoryname'],style: TextStyles.font16bold,),
                        Text(item['categorytype'],style: TextStyles.font12normal,),
                      ]),
                      horizontalSpace(100),
                      UserScreenContainer(text: 'نشط',containercolor: AppColors.success,)
                  ],
                ),
                  ]),
                  Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Column( crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('المورد',style: TextStyles.font12normal,),
                    
                    Text(item['storename'],style: TextStyles.font12w600,),
                      ]),
                   Column( 
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                   Text('السعر',style: TextStyles.font12normal,),
                   Text(item['categoryprise'],style: TextStyle(color: AppColors.primary,fontSize: 15,),),
                   ],
                   ),
                    ]),
                    verticalSpace(25),
                   Row( mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                   Container(
       width: 90,
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.lightSurface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.neutral60.withOpacity(0.5),
          width: 2,
        ),
      ),
      child: Row(children: [
        Icon(Icons.mode_edit_outlined,size: 20,color: AppColors.darkSurface,),
        Text('تعديل',style: TextStyle(color: AppColors.darkSurface,fontSize: 15,),)
      ],)),
      horizontalSpace(30),
       Container(
       width: 90,
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.lightSurface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.neutral60.withOpacity(0.5),
          width: 2,
        ),
      ),
      child: Row(children: [
        Icon(Icons.delete_outline,size: 20,color: AppColors.error,),
        Text('حذف',style: TextStyle(color: AppColors.error,fontSize: 15,),)
      ],)),
                ],)
              
          ],);
        
         });
  }
}