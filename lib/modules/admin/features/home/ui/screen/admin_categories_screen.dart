import 'package:b2b/core/helpers/spacing.dart';
import 'package:b2b/core/theme/colors.dart';
import 'package:b2b/core/theme/textstyles.dart';
import 'package:b2b/core/widgets/app_search_filed.dart';
import 'package:b2b/modules/admin/features/home/ui/widgets/activities.dart';
import 'package:b2b/modules/admin/features/home/ui/widgets/add_botton.dart';
import 'package:b2b/modules/admin/features/home/ui/widgets/admin_home_big_container.dart';
import 'package:b2b/modules/admin/features/home/ui/widgets/appbar_first_container.dart';
import 'package:b2b/modules/admin/features/home/ui/widgets/categories_list.dart';
import 'package:b2b/modules/admin/features/home/ui/widgets/distribution_of_users.dart';
import 'package:b2b/modules/admin/features/home/ui/widgets/homecountainer.dart';
import 'package:b2b/modules/admin/features/home/ui/widgets/numberofrequests.dart';
import 'package:b2b/modules/admin/features/home/ui/widgets/smallcircular.dart';
import 'package:b2b/modules/admin/features/home/ui/widgets/total_sales.dart';
import 'package:b2b/modules/admin/features/home/ui/widgets/user_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:b2b/core/theme/app_colors.dart';
import 'package:b2b/core/widgets/snakBar/app_bottom_nav_bar.dart';

class AdminCategoriesScreen extends StatelessWidget {
  const AdminCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
     body:  ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppbarFirstContainer(),
              verticalSpace(30),
               Row(
                 children: [
                   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Padding(
                        padding: const EdgeInsets.all(9.5),
                        child: Text(
                          'ادارة المنتجات',
                          style: TextStyles.font16bold,
                          textAlign: TextAlign.left,
                        ),
                                     ),
              verticalSpace(10.h),
              Padding(
                padding: const EdgeInsets.all(9.5),
                child: Text(
                  'ادارة و تعديل منتجات النظام',
                  style: TextStyles.font12normal,
                  textAlign: TextAlign.left,
                ),
              ),
                     ]),
             horizontalSpace(150),
              AddBotton(iconbottun: Icons.add,textbottun: 'اضافة منتج',),
                 ]
               ),
           AppSearchFiled(hintText: 'ابحث عن منتج...'),
           verticalSpace(30),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               UserContainer(iconnumbercolor:AppColors.primary ,
                numbericon: Icons.looks_4_outlined, text:'اجمالي المنتجات'),
                 UserContainer(iconnumbercolor:AppColors.success ,
                numbericon: Icons.looks_4_outlined, text:'نشط'),
                 UserContainer(iconnumbercolor:AppColors.darkOutline ,
                numbericon: Icons.looks_4_outlined, text:'الفئات'),
                
             ],
           ),
           verticalSpace(30),
           SizedBox( width: double.infinity, height: 500,
             child: CategoriesList(
              categories: [
                {
              "image":"https://categories.com/image.jgp",
              "categoryname":"حليب كامل الدسم",
              "categorytype":"ألبان",
              "storename":"الألبان الوطنية",
              "categoryprise":"ر.س/12لتر"
                },
 {
              "image":"https://categories.com/image.jgp",
              "categoryname":"حليب كامل الدسم",
              "categorytype":"ألبان",
              "storename":"الألبان الوطنية",
              "categoryprise":"ر.س/12لتر"
                },
              ]
             ),
           ),
            ],
          )
        
      ],
    ),
    );
  }}