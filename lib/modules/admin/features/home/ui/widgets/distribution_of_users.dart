import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
        gradient: SweepGradient(colors: colors, stops: stops),
      ),
    );
  }
}
