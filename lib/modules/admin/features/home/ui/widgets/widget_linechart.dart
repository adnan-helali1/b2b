// import 'package:b2b/core/theme/app_colors.dart';
// import 'package:b2b/core/theme/textstyles.dart';
// import 'package:flutter/widgets.dart';
// import 'package:b2b/core/theme/colors.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';

// class WidgetLinechart extends StatelessWidget{

// const WidgetLinechart({super.key, required this.months});
// final List<String> months;
//   @override
//   Widget build(BuildContext context) {
//    return     SizedBox(
//                   height: 300,
//                    child: LineChart(
//
//
//
//
//




                    ///PLEASEEEEEEEE   DELETEEEEE MEEEEEE
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
//                       LineChartData(
//                         gridData: FlGridData(show: true,
//                        getDrawingVerticalLine: (value) {
//                           return const FlLine(color: ColorsManegar.grey,strokeWidth: 0.5,dashArray: [10,3]);
//                        },
//                         getDrawingHorizontalLine: (value) {
//                           return const FlLine(color: ColorsManegar.grey,strokeWidth: 0.5,dashArray: [10,3]);
//                         },),
//                        titlesData: FlTitlesData(topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
//                          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
//                         bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true,interval: 30000,getTitlesWidget: (value, meta) {
//                           int index=value.toInt();
//                           if (index<0||index>=months.length) {
//                             return const SizedBox.shrink();
//                           }
//                           return(Text(months[index],style: TextStyles.font12normal,));
//                         },)),
//                          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true,interval: 1))
//                          ),
//                         borderData: FlBorderData(border: Border(
//                           bottom: BorderSide(color: Colors.black,width: 1),
//                           left: BorderSide(color: Colors.black,width: 1),
//                           top: BorderSide(color: Colors.transparent),
//                           right:  BorderSide(color: Colors.transparent),
//                         )),
//                         lineBarsData: [
//                           LineChartBarData(
//                             spots: [
//                               FlSpot(0, 80000),
//                               FlSpot(1,90000),
//                               FlSpot(3,8899),
//                               FlSpot(4,11000),
//                               FlSpot(5,10000),
//                               FlSpot(6,12000),
//                             ],
//                             isCurved: true,
//                             color: AppColors.primary,
//                             barWidth: 3,
//                             dotData: FlDotData(show: true,getDotPainter: (spot,percent,barData,index){
//                               return FlDotCirclePainter(radius: 5,
//                               color: ColorsManegar.white,
//                               strokeWidth: 2,
//                               strokeColor: AppColors.primary);
//                             }),
//                           ),
//                         ],
//                       ),
//                     ),
//    );
//   }
// }