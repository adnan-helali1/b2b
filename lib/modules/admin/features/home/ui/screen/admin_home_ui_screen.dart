import 'package:b2b/core/helpers/spacing.dart';
import 'package:b2b/core/theme/colors.dart';
import 'package:b2b/core/theme/textstyles.dart';
import 'package:b2b/modules/admin/features/home/ui/widgets/admin_home_big_container.dart';
import 'package:b2b/modules/admin/features/home/ui/widgets/homecountainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:b2b/core/theme/app_colors.dart';
//
//
//
// 7ag nest3mel el colors mn app colors w est3mli el color scheme bta3 el theme 3shan t7sni el code  meshan allah
//
//
//

class AdminHomeUiScreen extends StatelessWidget {
  const AdminHomeUiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      //
      //
      //
      //

      // esta3mli cs color اbadal ma t7ot color mn appcolors
      //
      //
      //
      //
      backgroundColor: AppColors.lightSurfaceVariant,

      //  7awli t7oti listview badal singlechildscrollview w est3mli shrinkwrap: true
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //
              //
              //
              //
              //

              // hon can bt7sni t3mli el container b widget w t7ot el decoration w el padding w el row fe widget tani w t3mli el icons w el text fe widgetat taniya 3shan tkoun aktr modular w t9dr tst3mlyha fe makan tani
              //
              //
              //
              //
              //
              //
              //
              //
              //
              //
              //
              Container(
                width: double.infinity,
                height: 100.h,
                decoration: BoxDecoration(color: cs.surface),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      //
                      //
                      //
                      //
                      //
                      //

                      // container wahed bas lish 7ata 2 jarbi est3mli icon color aw cercle avatar//
                      //
                      //
                      //
                      //
                      //
                      //
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          // est3mli color: cs.primary,
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
                      //
                      //
                      ///
                      ///
                      ///
                      ///
                      ///
                      ///
                      ///
                      // mu ghalat Bas mu sah nest3mli horizontal space 150 we can  nest3mli spacer///

                      ///
                      ///
                      ///
                      ///
                      ///
                      ///
                      ///
                      Spacer(),
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

              ///
              ///
              ///
              ///
              ///
              ///
              ///
              // had elkalam w el code lazem ekonu b widget la7aln//
              ///
              ///
              ///
              ///
              ///
              ///
              ///
              ///
              ///
              ///
              ///
              ///
              ///
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

              ///

              ///
              ///
              ///
              ///
              ///
              ///
              ///
              // besara7a el row hay fantastic bas hawli econo el names a7san
              ///
              ///
              ///
              ///
              ///
              ///
              ///
              ///
              ///
              ///
              ///
              ///
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
              //
              //
              ///

              // hay widget la7ala mbine ktir in big container//

              //
              //
              ///
              /////
              /////
              /////
              ///
              ///
              ///
              ///
              ///
              verticalSpace(50.h),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: BigContainer(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('اجمالي المبيعات', style: TextStyles.font16bold),
                          horizontalSpace(50.w),
                          Container(
                            width: 70,
                            height: 20,
                            decoration: BoxDecoration(
                              color: AppColors.secondaryDark,
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

                      ///

                      ///
                      ///
                      ///
                      ///
                      ///

                      ///
                      ///
                      ///
                      ///
                      ///
                    ), //haaay el widget besara7a betr3eb ana behayate ma sheft hek she bansa7ek te7zfia w terg3i tektbia lano widget mor3ebe be m3na el kelme
                    // WidgetLinechart(///

                    ///
                    ///
                    ///
                    ///
                    ///
                    ///
                    //   months: [
                    //     "يناير",
                    //     "فبراير",
                    //     "مارس",
                    //     "أبريل",
                    //     "مايو",
                    //     "يونيو",
                    //   ],
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
