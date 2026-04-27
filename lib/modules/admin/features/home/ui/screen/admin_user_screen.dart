import 'package:b2b/core/theme/textstyles.dart';
import 'package:b2b/core/widgets/app_search_filed.dart';
import 'package:b2b/modules/admin/features/home/ui/widgets/add_botton.dart';
import 'package:b2b/modules/admin/features/home/ui/widgets/homecountainer.dart';
import 'package:b2b/modules/admin/features/home/ui/widgets/user_container.dart';
import 'package:b2b/modules/admin/features/home/ui/widgets/user_screen_container.dart';
import 'package:b2b/modules/admin/features/home/ui/widgets/usersname.dart';
import 'package:flutter/material.dart';
import 'package:b2b/core/theme/app_colors.dart';
import 'package:b2b/modules/admin/features/home/ui/widgets/appbar_first_container.dart';
import 'package:b2b/core/helpers/spacing.dart';

class AdminUserScreen extends StatelessWidget {
  const AdminUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: ListView(
        physics: NeverScrollableScrollPhysics(),
        children:[
          
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                        AppbarFirstContainer(),
                        verticalSpace(30),
               Padding(
                 padding: const EdgeInsets.all(9.5),
                 child: Text(
                      'ادارة المستخدمين',
                      style: TextStyles.font16bold,
                     textAlign: TextAlign.left,
                    ),
               ),
                
                verticalSpace(10),
                Padding(
                  padding: const EdgeInsets.all(9.5),
                  child: Text(
                    'جميع مستخدمي النظام',
                    style: TextStyles.font12normal,
                    textAlign: TextAlign.left,
                  ),
                ),
                verticalSpace(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                UserContainer(iconnumbercolor: AppColors.darkSurface,
                 numbericon: Icons.looks_6_outlined, text: 'اجمالي',),
                 UserContainer(iconnumbercolor: AppColors.success,
                 numbericon: Icons.looks_4_outlined, text: 'نشط',),
                 UserContainer(iconnumbercolor: AppColors.warning,
                 numbericon: Icons.looks_one_outlined, text: 'قيد المراجعة',),
                ]
              ),
              verticalSpace(15),
              Row(
                children: [
                  Expanded(child: AppSearchFiled(hintText: 'ابحث عن مستخدم...')),
                  AddBotton(iconbottun: Icons.person_add_alt,textbottun: 'اضافة',),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  UserScreenContainer(text: 'الكل',containercolor: AppColors.lightSurface,),
                  UserScreenContainer(text: 'متاجر',containercolor: AppColors.lightSurface),
                  UserScreenContainer(text: 'موردين',containercolor: AppColors.lightSurface),
                  UserScreenContainer(text: 'مدراء',containercolor: AppColors.lightSurface),
                ],
              ),
              SizedBox(
                width: double.infinity,
                height: 500,
                child: Usersname(
                  usersname: [
                    {
                      "Icon": Icons.store_mall_directory_outlined,
                      "Iconcolor": AppColors.success,
                      "text1": 'أحمد محمد السعيد',
                      "text2": 'aggggtr',
                    },
                    {
                      "Icon": Icons.store_mall_directory_outlined,
                      "Iconcolor": AppColors.success,
                      "text1": 'أحمد محمد السعيد',
                      "text2": 'aggggtr',
                    },
                  ],
                ),
              ),
                       
                     ]
                   ),
           
        ],
    )
    );
  }
}
