import 'package:b2b/core/helpers/spacing.dart';
import 'package:b2b/core/theme/colors.dart';
import 'package:b2b/core/theme/textstyles.dart';
import 'package:b2b/modules/admin/features/home/ui/widgets/activities.dart';
import 'package:b2b/modules/admin/features/home/ui/widgets/admin_home_big_container.dart';
import 'package:b2b/modules/admin/features/home/ui/widgets/appbar_first_container.dart';
import 'package:b2b/modules/admin/features/home/ui/widgets/distribution_of_users.dart';
import 'package:b2b/modules/admin/features/home/ui/widgets/homecountainer.dart';
import 'package:b2b/modules/admin/features/home/ui/widgets/numberofrequests.dart';
import 'package:b2b/modules/admin/features/home/ui/widgets/smallcircular.dart';
import 'package:b2b/modules/admin/features/home/ui/widgets/total_sales.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:b2b/core/theme/app_colors.dart';
import 'package:b2b/core/widgets/snakBar/app_bottom_nav_bar.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    //final mn= Theme.of(context). extension<AppColors>()!;
    return Scaffold(
      backgroundColor: AppColors.lightBackground,

      //  7awli t7oti listview badal singlechildscrollview w est3mli shrinkwrap: true
      body: ListView(
        shrinkWrap: true,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppbarFirstContainer(),

              verticalSpace(50.h),
              Padding(
                padding: const EdgeInsets.all(9.5),
                child: Text(
                  'نظرة عامة',
                  style: TextStyles.font16bold,
                  textAlign: TextAlign.left,
                ),
              ),
              verticalSpace(10.h),
              Padding(
                padding: const EdgeInsets.all(9.5),
                child: Text(
                  'احصائيات النظام الكاملة',
                  style: TextStyles.font12normal,
                  textAlign: TextAlign.left,
                ),
              ),
              verticalSpace(30.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AdminHomeCountainer(
                    width: 150,
                    height: 150,
                    size: 30,
                    icon1: Icons.attach_money_sharp,
                    text1: 'اجمالي المبيعات',
                    text2: '524,580ر.س',
                    icon2: Icons.trending_up_outlined,
                    text3: '+18.5%',
                    colorcont1: AppColors.success,
                    coloricon1: AppColors.successContainer,
                  ),
                  AdminHomeCountainer(
                    height:150,
                    width: 150,
                    size: 30,
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
                    width: 150,
                    height: 150,
                    size: 30,
                    icon1: Icons.storefront_outlined,
                    text1: 'المتاجر النشطة',
                    text2: '89ر.س',
                    icon2: Icons.trending_up_outlined,
                    text3: '+5.3%',
                    colorcont1: Colors.purpleAccent,
                    coloricon1: Colors.purple,
                  ),
                  AdminHomeCountainer(
                    width: 150,
                    height: 150,
                    size: 30,
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
              BigContainer(
                width: double.infinity,height: 300,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('اجمالي المبيعات', style: TextStyles.font16bold),
                      horizontalSpace(50.w),
                      Container(
                        width: 70,
                        height: 20,
                        decoration: BoxDecoration(
                          color: cs.secondaryContainer,
                          borderRadius: BorderRadius.circular(15),
                        ),

                        child: Text(
                          'اخر 6 شهور',
                          style: TextStyle(
                            color: ColorsManegar.white,
                            fontSize: 13,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(50.h),
                  SizedBox(
                    height: 200,
                    width: 400,
                    child: TotalSales(
                      data: [0, 20, 1, 4],
                      months: ['kkk', 'llll', 'kkk', 'hhh'],
                      divisions: 5,
                      maxY: 20,
                    ),
                  ),
                ],
              ),
              BigContainer(
                 width: double.infinity,height: 300,
                children: [
                  Text('عدد الطلبات', style: TextStyles.font16bold),
                  verticalSpace(50.h),
                  SizedBox(
                    height: 200,
                    width: 400,
                    child: Numberofrequests(
                      data: [0, 1, 2, 10],
                      labels: ['ooo', 'jjj', 'mmm', 'ccc'],
                      divisions: 5,
                      maxY: 20,
                    ),
                  ),
                ],
              ),

              BigContainer(
                 width: double.infinity,height: 300,
                children: [
                  Text('توزيع المستخدمين', style: TextStyles.font16bold),
                  verticalSpace(100.h),
                  Row(
                    children: [
                      SizedBox(
                        height: 150,
                        width: 200,
                        child: DistributionOfUsers(
                          colors: [
                            cs.primary,
                            cs.primary,
                            cs.secondary,
                            cs.secondary,
                            AppColors.purpleCardDark,
                            AppColors.purpleCardDark,
                          ],
                          stops: [0.3, 0.3, 0.7, 0.7, 0.9, 1.0],
                        ),
                      ),
                      Column(
                        children: [
                          Smallcircular(
                            colorcircle: [
                              Colors.yellow,
                              Colors.pink,
                              Colors.deepOrange,
                            ],
                            textnear: ['متاجر', 'موردين', 'مدراء'],
                          ),
                        ],
                      ),
                      horizontalSpace(20),
                      Column(
                        children: [
                          Text('65%', style: TextStyles.font15w700),
                          verticalSpace(10),
                          Text('25%', style: TextStyles.font15w700),
                          verticalSpace(10),
                          Text('10%', style: TextStyles.font15w700),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              BigContainer(
                 width: double.infinity,height: 300,
                children: [
                  Activities(
                    activity: [
                      {
                        "activityname": "متجر الأسرة",
                        "discriptoin": "طلب جديد",
                        "prise": "2.450ر.س",
                        "time": "منذ 5 دقائق",
                        "colorIcon": Colors.blue,
                        "Icon": Icons.shopping_bag_outlined,
                      },
                      {
                        "activityname": "شركة التوريد",
                        "discriptoin": "تحديث منتج",
                        "prise": "",
                        "time": "منذ 15 دقيقة",
                        "colorIcon": Colors.green,
                        "Icon": Icons.space_dashboard_sharp,
                      },
                    ],
                  ),
                ],
              ),
              // SizedBox(
              //   height: 200,
              //   width: 200,
              //   child: AppBottomNavBar(label1:'hhhhh',
              //   label2: 'eeeee', label3: 'vvvvv',
              //    label4: 'ppppp', icon1: Icon(Icons.abc),
              //     icon2:Icon(Icons.abc) , icon3:Icon(Icons.abc) ,
              //      icon4: Icon(Icons.abc)),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
