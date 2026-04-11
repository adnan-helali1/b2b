import 'package:b2b/core/helpers/spacing.dart';
import 'package:b2b/core/theme/colors.dart';
import 'package:b2b/core/theme/textstyles.dart';
import 'package:b2b/core/widgets/snakBar/app_bottom_nav_bar.dart';
import 'package:b2b/modules/admin/features/home/ui/widgets/activities.dart';
import 'package:b2b/modules/admin/features/home/ui/widgets/admin_home_big_container.dart';
import 'package:b2b/modules/admin/features/home/ui/widgets/distribution_of_users.dart';
import 'package:b2b/modules/admin/features/home/ui/widgets/homecountainer.dart';
import 'package:b2b/modules/admin/features/home/ui/widgets/numberofrequests.dart';
import 'package:b2b/modules/admin/features/home/ui/widgets/smallcircular.dart';
import 'package:b2b/modules/admin/features/home/ui/widgets/total_sales.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:b2b/core/theme/app_colors.dart';  

class AdminHomeUiScreen extends StatelessWidget {
  const AdminHomeUiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: AppColors.lightSurfaceVariant,
      body:  ListView(children: [
        Column(
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
                  BigContainer(
                  
                    children: [Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('اجمالي المبيعات',style: TextStyles.font16BlackBold,),
                     
                      Container(
                        width: 100,
                        height: 30,
                        decoration: BoxDecoration(
                          color: AppColors.secondaryDark,
            borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text('اخر 6 شهور',textAlign: TextAlign.center,style: TextStyle(
                          color: ColorsManegar.white,fontSize: 15,),),
                      ),
                    ],
                  ),
                  verticalSpace(20),
                  SizedBox(
                    height: 200,
                    width: 350,
                    child: TotalSales(data: [50,55,50,60,59,70], months:  ['يناير','فبراير','مارس','أبريل','مايو','يونيو']),), ],
                  ),
                   BigContainer(
                  
                    children: [
                      Text('عدد الطلبات',style: TextStyles.font16BlackBold,),
                  SizedBox(
                    height: 230,
                    width: 300,
                    child: BarChartOnly(data: [50,55,50,60,65,80], labels: ['يناير','فبراير','مارس','أبريل','مايو','يونيو']))
                  ],
                  ),
                   BigContainer(
                  
                    children: [
                      Text('توزيع المستخدمين',style: TextStyles.font16BlackBold,),
                  verticalSpace(40),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     DistributionOfUsers(stops: [0.0,0.65,0.65,0.90,0.90,1.0],size:150,
                          colors: [AppColors.primary,
                          AppColors.primary,
                           Colors.purple,
                             Colors.purple,
                            AppColors.secondaryDark,
                              AppColors.secondaryDark ],
                          ),
                          Smallcircular(colorcircle: [AppColors.primary,AppColors.secondaryDark,Colors.purple], 
                          textnear: ['متاجر','موردين','مدراء']),
                        
                          Column(
                            children: [
                          Text('65%',style:TextStyles.font16bold),
                          verticalSpace(10),
                          Text('25%',style:TextStyles.font16bold),
                           verticalSpace(10),
                          Text('10%',style:TextStyles.font16bold),
                            ],
                          )
                   ],
                 ), 
                  ],
                  ),
                  BigContainer(children: [
                     Text('النشاط الأخير',style: TextStyles.font16BlackBold,),
                   Activities(
  activity: [
    {
      "activityname": "متجر الأسرة",
      "discriptoin": "طلب جديد",
      "prise": "2330",
      "time": "منذ 15 دقيقة",
      "colorIcon": Colors.blue,
      "Icon":Icons.store,
     
    },
    {
      "activityname": "متجر الأمل",
      "discriptoin": "تم الإرسال",
      "prise": "1200",
      "time": "منذ ساعة",
      "colorIcon": Colors.green,
      "Icon":Icons.car_crash,
     
    },
    
  ],
)
                            ]),
                        /* AppBottomNavBar(label1: 'k', label2: 'g',
                           label3: '[]', label4: 'a', 
                           icon1: Icon(Icons.home), 
                           icon2: Icon(Icons.verified_user_sharp),
                            icon3: Icon(Icons.store),
                             icon4: Icon(Icons.book)) */ 
                ],
              ),
     ] ),
    
     
      );
      
      
    
  }
}
