import 'package:b2b/core/theme/textstyles.dart';
import 'package:b2b/core/widgets/app_search_filed.dart';
import 'package:b2b/modules/admin/features/home/ui/widgets/add_botton.dart';
import 'package:b2b/modules/admin/features/home/ui/widgets/homecountainer.dart';
import 'package:b2b/modules/admin/features/home/ui/widgets/usercontainers.dart';
import 'package:b2b/modules/admin/features/home/ui/widgets/usersname_list.dart';
import 'package:b2b/modules/admin/features/home/ui/widgets/usercontainer_only_text.dart';
import 'package:flutter/material.dart';
import 'package:b2b/core/theme/app_colors.dart';
import 'package:b2b/modules/admin/features/home/ui/widgets/appbar_first_container.dart';
import 'package:b2b/core/helpers/spacing.dart';


class AdminUiUserScreen extends StatelessWidget {
  const AdminUiUserScreen({super.key,});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    backgroundColor: AppColors.lightBackground,
   body: ListView(
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
     children: [Expanded(
       child: Column(
        
              crossAxisAlignment: CrossAxisAlignment.start,
         children: [
             AppbarFirstContainer(),
              verticalSpace(10),
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
          Padding(
            padding: EdgeInsetsGeometry.all(10),
            child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
               Usercontainers(icon1: Icons.looks_6_outlined,
                text1:'اجمالي',
                 coloricon1: AppColors.neutral0,
                 width: 100,height: 80,),
             Usercontainers(icon1: Icons.looks_4_outlined,
              text1:'نشط', coloricon1: AppColors.success,
              width: 100,height: 80,),
             Usercontainers(icon1: Icons.looks_one_outlined,
              text1: 'قيد المراجعة', coloricon1: AppColors.warning,
              width: 100,height: 80,),
              ]),
          ),
            verticalSpace(30),
            Row(
             children: [
               Expanded(child: AppSearchFiled(hintText: 'ابحث عن مستخدم...')),
               AddBotton(),
             ],
            ),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
             Usertextcontainer(text: 'الكل'),
             Usertextcontainer(text: 'متاجر'),
             Usertextcontainer(text: 'موردين'),
             Usertextcontainer(text: 'مدراء'),
             ],
           ),
         
            SizedBox(
              width: double.infinity,
              height: 500,
              child: Usersname(usersname: [
                {
                  "Icon":Icons.store_mall_directory_outlined,
                  "Iconcolor":AppColors.success,
                  "text1":'أحمد محمد السعيد',
                  "text2":'aggggtr',
                },
                {
                  "Icon":Icons.store_mall_directory_outlined,
                  "Iconcolor":AppColors.success,
                  "text1":'أحمد محمد السعيد',
                  "text2":'aggggtr',
                },
                           ]),
            ),
            
        
         ],
       ),
     ),
     ]
   ),
   );

  }}