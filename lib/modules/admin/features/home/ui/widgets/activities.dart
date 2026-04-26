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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: item['colorIcon']??Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(item['Icon']??Icons.error,),
                ),
                horizontalSpace(15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['activityname']??'err',
                      style: TextStyles.font14,
                    ),
                    Text(
                      item['discriptoin']??'err',
                      style: TextStyles.font12normal,
                    ),
                  ],
                ),
               horizontalSpace(150),
                Column(
                  children: [
                    Text(
                      item['prise']??'200',
                      style: TextStyles.font15w700,
                    ),
                    Text(
                      item['time']??'23h',
                      style: TextStyles.font12normal,
                    ),
                  ],
                ),
              ],
            ),
            verticalSpace(15),
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
