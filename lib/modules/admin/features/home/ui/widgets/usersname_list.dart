import 'package:b2b/core/helpers/spacing.dart';
import 'package:b2b/modules/admin/features/home/ui/widgets/admin_home_big_container.dart';
import 'package:b2b/modules/admin/features/home/ui/widgets/admin_icons.dart';
import 'package:b2b/modules/admin/features/home/ui/widgets/usercontainers.dart';
import 'package:b2b/modules/admin/features/home/ui/widgets/usercontainer_only_text.dart';
import 'package:flutter/material.dart';
import 'package:b2b/core/theme/app_colors.dart';
import 'package:flutter/widgets.dart';
import 'package:b2b/core/theme/textstyles.dart';

class Usersname extends StatelessWidget {

   final List<Map<String, dynamic>> usersname;
   Usersname({
    required this.usersname,
    super.key,
   });
   @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return ListView.builder(scrollDirection: Axis.vertical,
  
    itemCount: usersname.length,
    itemBuilder: (context, index) {
     final item = usersname[index];
     return BigContainer(
      height: 100,
      children: [
      Row(children: [
        AdminIcons(circulcolor: AppColors.lightBackground,
         icon:item['Icon'] , iconcolor: item['Iconcolor']),
         horizontalSpace(50),
        Column(
          children: [
          Text(item['text1'],style: TextStyles.font16bold,),
          verticalSpace(5),
          Text(item['text2'],style: TextStyles.font14,),
          verticalSpace(5),
          Row(
            children: [
             Usertextcontainer(text: 'متجر'),
             horizontalSpace(15),
             Usertextcontainer(text: 'نشط'),
            ],
          )
         ],),
         horizontalSpace(80),
         Icon(Icons.more_vert,size: 20,),
      ],)
      ]);
    },);
  }
}