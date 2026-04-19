import 'package:b2b/core/theme/textstyles.dart';
import 'package:b2b/core/widgets/app_search_filed.dart';
import 'package:b2b/modules/admin/features/home/ui/widgets/add_botton.dart';
import 'package:b2b/modules/admin/features/home/ui/widgets/homecountainer.dart';
import 'package:b2b/modules/admin/features/home/ui/widgets/user_screen_container.dart';
import 'package:b2b/modules/admin/features/home/ui/widgets/usersname.dart';
import 'package:flutter/material.dart';
import 'package:b2b/core/theme/app_colors.dart';

class AdminUiUserScreen extends StatelessWidget {
  const AdminUiUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('ادارة المستخدمين', style: TextStyles.font16bold),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('جميع مستخدمي النظام', style: TextStyles.font12normal),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AdminHomeCountainer(
                width: 100,
                height: 100,
                size: 50,
                icon1: Icons.looks_6_outlined,
                text1: 'اجمالي',
                text2: '',
                icon2: null,
                text3: '',
                colorcont1: null,
                coloricon1: AppColors.neutral0,
              ),
              AdminHomeCountainer(
                width: 100,
                height: 100,
                size: 50,
                icon1: Icons.looks_4_outlined,
                text1: 'نشط',
                text2: '',
                icon2: null,
                text3: '',
                colorcont1: null,
                coloricon1: AppColors.success,
              ),
              AdminHomeCountainer(
                width: 100,
                height: 100,
                size: 50,
                icon1: Icons.looks_one_outlined,
                text1: 'قيد المراجعة',
                text2: '',
                icon2: null,
                text3: '',
                colorcont1: null,
                coloricon1: AppColors.warning,
              ),
            ],
          ),
          Row(
            children: [
              Expanded(child: AppSearchFiled(hintText: 'ابحث عن مستخدم...')),
              AddBotton(),
            ],
          ),
          Row(
            children: [
              UserScreenContainer(text: 'الكل'),
              UserScreenContainer(text: 'متاجر'),
              UserScreenContainer(text: 'موردين'),
              UserScreenContainer(text: 'مدراء'),
            ],
          ),
          Usersname(
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
        ],
      ),
    );
  }
}
