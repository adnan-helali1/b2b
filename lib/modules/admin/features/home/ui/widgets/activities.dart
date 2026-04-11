import 'package:b2b/core/helpers/spacing.dart';
import 'package:b2b/core/theme/colors.dart';
import 'package:b2b/core/theme/textstyles.dart';
import 'package:flutter/material.dart';


 class Activities extends StatelessWidget {
  final List<Map<String, dynamic>> activity;

  const Activities({
    super.key,
    required this.activity,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: activity.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final item = activity[index];

        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: item['colorIcon'],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(item['Icon'],),
                ),
                horizontalSpace(15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['activityname'],
                      style: TextStyles.font14,
                    ),
                    Text(
                      item['discriptoin'],
                      style: TextStyles.font12normal,
                    ),
                  ],
                ),
               horizontalSpace(180),
                Column(
                  children: [
                    Text(
                      item['prise'],
                      style: TextStyles.font14,
                    ),
                    Text(
                      item['time'],
                      style: TextStyles.font12normal,
                    ),
                  ],
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(5),
              width: double.infinity,
              height: 2,
              color: ColorsManegar.grey,
              
            ),
          ],
        );
      },
    );
  }
}
