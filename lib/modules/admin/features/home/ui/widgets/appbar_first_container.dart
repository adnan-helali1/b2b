import 'package:b2b/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:b2b/core/theme/app_colors.dart';
import 'package:flutter/widgets.dart';
import 'package:b2b/modules/admin/features/home/ui/widgets/admin_home_big_container.dart';
import 'package:b2b/modules/admin/features/home/ui/widgets/admin_icons.dart';
import 'package:b2b/modules/admin/features/home/ui/widgets/homecountainer.dart';
import 'package:b2b/modules/super/features/home/data/data.dart';
import 'package:flutter/material.dart';
import 'package:b2b/core/theme/textstyles.dart';
import 'package:b2b/core/helpers/spacing.dart';
class AppbarFirstContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    //final mn= Theme.of(context). extension<AppColors>()!;
    // TODO: implement build
    return  Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(color: cs.surface),child: 
            Row(
              children: [
             AdminIcons(circulcolor: cs.primary, icon: Icons.add_moderator_outlined,
              iconcolor:cs.surface,
              ),
               horizontalSpace(20),
                      Column(
                        children: [
                          Text('لوحة الادارة', style: TextStyles.font16bold),
                          verticalSpace(20),
                          Text('مدير النظام', style: TextStyles.font12normal),
                        ],
                      ),
                       Spacer(),
                     AdminIcons(circulcolor: cs.surface,
                      icon: Icons.dark_mode_outlined, iconcolor: cs.primary),
                      horizontalSpace(10),
                     AdminIcons(circulcolor: cs.surface,
                      icon: Icons.arrow_forward,
                       iconcolor: Colors.red),
              ]),
             );
             
    
  }
  
}