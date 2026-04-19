import 'package:b2b/modules/admin/features/home/ui/widgets/admin_home_big_container.dart';
import 'package:b2b/modules/admin/features/home/ui/widgets/admin_icons.dart';
import 'package:b2b/modules/admin/features/home/ui/widgets/user_screen_container.dart';
import 'package:flutter/material.dart';
import 'package:b2b/core/theme/app_colors.dart';
import 'package:b2b/core/theme/textstyles.dart';

class Usersname extends StatelessWidget {
  final List<Map<String, dynamic>> usersname;
  Usersname({required this.usersname, super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      shrinkWrap: true,
      itemCount: usersname.length,
      itemBuilder: (context, index) {
        final item = usersname[index];
        BigContainer(
          children: [
            Row(
              children: [
                AdminIcons(
                  circulcolor: AppColors.lightBackground,
                  icon: item['Icon'],
                  iconcolor: item['Iconcolor'],
                ),
                Column(
                  children: [
                    Text(item['text1'], style: TextStyles.font16bold),
                    Text(item['text2'], style: TextStyles.font14),
                    Row(
                      children: [
                        UserScreenContainer(text: 'متجر'),
                        UserScreenContainer(text: 'نشط'),
                      ],
                    ),
                  ],
                ),
                Icon(Icons.more_vert, size: 10),
              ],
            ),
          ],
        );
      },
    );
  }
}
