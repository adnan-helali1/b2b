import 'package:b2b/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:b2b/core/theme/app_colors.dart';

class TotalSales extends StatelessWidget {
  final List<double> data;
  final List<String> months;
  final int divisions;
  final double maxY;

  const TotalSales({
    super.key,
    required this.data,
    required this.months,
    this.divisions = 5,
    this.maxY = 100,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            Column(
              children: List.generate(divisions + 1, (i) {
                double value = maxY - (maxY / divisions * i);

                return Expanded(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 35,
                        child: Text(
                          value.toInt().toString(),
                          style: const TextStyle(fontSize: 11),
                        ),
                      ),

                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            border: Border(top: BorderSide(color: Colors.grey)),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
            Row(
              children: List.generate(data.length, (i) {
                return Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(right: BorderSide(color: Colors.grey)),
                    ),
                  ),
                );
              }),
            ),
            Positioned.fill(
              left: 35,
              child: CustomPaint(
                painter: _LinePainter(data: data, maxY: maxY),
              ),
            ),
            verticalSpace(100),
            Positioned(
              bottom: 0,
              left: 35,
              right: 0,
              child: Row(
                children: List.generate(months.length, (i) {
                  return Expanded(
                    child: Text(
                      months[i],
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 12),
                    ),
                  );
                }),
              ),
            ),
            Positioned(
              left: 35,
              top: 0,
              bottom: 0,
              child: Container(width: 2, color: Colors.black),
            ),
            Positioned(
              left: 35,
              right: 0,
              bottom: 0,
              child: Container(height: 2, color: Colors.black),
            ),
          ],
        );
      },
    );
  }
}

class _LinePainter extends CustomPainter {
  final List<double> data;
  final double maxY;

  _LinePainter({required this.data, required this.maxY});

  @override
  void paint(Canvas canvas, Size size) {
    final linePaint = Paint()
      ..color = AppColors.primary
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final dotFill = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final dotBorder = Paint()
      ..color = AppColors.primary
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    double stepX = size.width / (data.length - 1);

    Path path = Path();

    List<Offset> points = [];
    for (int i = 0; i < data.length; i++) {
      double x = i * stepX;
      double y = size.height - (data[i] / maxY * size.height);

      points.add(Offset(x, y));
    }
    for (int i = 0; i < points.length; i++) {
      if (i == 0) {
        path.moveTo(points[i].dx, points[i].dy);
      } else {
        path.lineTo(points[i].dx, points[i].dy);
      }
    }

    canvas.drawPath(path, linePaint);
    for (var point in points) {
      canvas.drawCircle(point, 5, dotFill);
      canvas.drawCircle(point, 5, dotBorder);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
