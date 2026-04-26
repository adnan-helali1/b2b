import 'package:flutter/material.dart';
import 'package:b2b/core/theme/app_colors.dart';
import 'package:flutter/widgets.dart';

class BigContainer extends StatelessWidget {
  final List<Widget> children;
  final double width;
  final double height;
  const BigContainer({super.key, 
  required this.children,
  required this.height,
  required this.width,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.lightSurface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.neutral60.withOpacity(0.5),
          width: 2,
        ),
      ),
      child: Column(
        // wa2t bedna n7ot el column  in scroll we need main axis aligment  start
        //  mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}
