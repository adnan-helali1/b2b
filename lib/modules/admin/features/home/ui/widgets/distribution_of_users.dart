import 'package:flutter/material.dart';
import 'package:b2b/core/theme/app_colors.dart';
import 'package:flutter/widgets.dart';
import 'package:b2b/modules/admin/features/home/ui/widgets/admin_home_big_container.dart';
import 'package:b2b/modules/admin/features/home/ui/widgets/homecountainer.dart';


class DistributionOfUsers extends StatelessWidget {
  final double size;
  final List<Color> colors;
  final List<double> stops; // النسب

  const DistributionOfUsers({
    Key? key,
    this.size = 120,
    required this.colors,
    required this.stops,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: SweepGradient(
          colors: colors,
          stops: stops,
        ),
      ),
    );
  }
} 
