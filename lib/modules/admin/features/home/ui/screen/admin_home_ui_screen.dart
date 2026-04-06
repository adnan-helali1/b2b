import 'package:b2b/core/helpers/spacing.dart';
import 'package:b2b/core/theme/colors.dart';
import 'package:b2b/core/theme/textstyles.dart';
import 'package:b2b/modules/admin/features/home/ui/widgets/admin_home_big_container.dart';
import 'package:b2b/modules/admin/features/home/ui/widgets/homecountainer.dart';
import 'package:b2b/modules/admin/features/home/ui/widgets/widget_linechart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:b2b/core/theme/app_colors.dart';

class AdminHomeUiScreen extends StatelessWidget {
  
  const AdminHomeUiScreen( {super.key});
  
  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    

    return Scaffold(
      backgroundColor: AppColors.lightSurfaceVariant,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 100.h,
                decoration: BoxDecoration(color: cs.surface),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Icon(
                          Icons.add_moderator_outlined,
                          color: ColorsManegar.white,
                          size: 30,
                        ),
                      ),
                      horizontalSpace(20.w),
                      Column(
                        children: [
                          Text('لوحة الادارة', style: TextStyles.font16bold),
                          verticalSpace(20.h),
                          Text('مدير النظام', style: TextStyles.font12normal),
                        ],
                      ),
                      horizontalSpace(150.w),
                      Icon(
                        Icons.dark_mode_outlined,
                        color: ColorsManegar.blac,
                        size: 30,
                      ),
                      horizontalSpace(10.w),
                      Icon(
                        Icons.arrow_forward,
                        color: ColorsManegar.red,
                        size: 30,
                      ),
                    ],
                  ),
                ),
              ),
              verticalSpace(50.h),
              Text(
                'نظرة عامة',
                style: TextStyles.font16bold,
                textAlign: TextAlign.left,
              ),
              verticalSpace(10.h),
              Text(
                'احصائيات النظام الكاملة',
                style: TextStyles.font12normal,
                textAlign: TextAlign.left,
              ),
              verticalSpace(30.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AdminHomeCountainer(
                    icon1: Icons.attach_money_sharp,
                    text1: 'اجمالي المبيعات',
                    text2: '524,580ر.س',
                    icon2: Icons.trending_up_outlined,
                    text3: '+18.5%',
                    colorcont1: AppColors.success,
                    coloricon1: AppColors.successContainer,
                  ),
                  AdminHomeCountainer(
                    icon1: Icons.shopping_bag_outlined,
                    text1: 'الطلبات الكلية',
                    text2: '1,847ر.س',
                    icon2: Icons.trending_up_outlined,
                    text3: '+12.2%',
                    colorcont1: AppColors.secondary,
                    coloricon1: AppColors.primary,
                  ),
                ],
              ),
              verticalSpace(80.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AdminHomeCountainer(
                    icon1: Icons.storefront_outlined,
                    text1: 'المتاجر النشطة',
                    text2: '89ر.س',
                    icon2: Icons.trending_up_outlined,
                    text3: '+5.3%',
                    colorcont1: Colors.purpleAccent,
                    coloricon1: Colors.purple,
                  ),
                  AdminHomeCountainer(
                    icon1: Icons.fire_truck_outlined,
                    text1: 'الموردين',
                    text2: '34ر.س',
                    icon2: Icons.trending_up_outlined,
                    text3: '+2.8%',
                    colorcont1: Colors.orangeAccent,
                    coloricon1: Colors.orange,
                  ),
                ],
              ),
              verticalSpace(50.h),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: BigContainer(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('اجمالي المبيعات',style: TextStyles.font16bold,),
                        horizontalSpace(50.w),
                        Container(
                          width: 70,
                          height: 20,
                          decoration: BoxDecoration(
                            color: AppColors.secondaryDark,
                             borderRadius: BorderRadius.circular(15),
                          ),
                        
                          child: Text('اخر 6 شهور',style: TextStyle(color: ColorsManegar.white,fontSize: 13, ),textAlign: TextAlign.right,),
                        ),
                      ],
                    ),
                  ),
                WidgetLinechart(months: ["يناير","فبراير","مارس","أبريل","مايو","يونيو"])
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
