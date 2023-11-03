import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'bar_data.dart';

class MyBarGraph extends StatelessWidget {
  final double? maxY;
  final double sunAmount;
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thurAmount;
  final double friAmount;
  final double satAmount;


   MyBarGraph({
    super.key,
    required this.maxY,
    required this.sunAmount,
    required this.monAmount,
    required this.tueAmount,
    required this.wedAmount,
    required this.thurAmount,
    required this.friAmount,
    required this.satAmount,

  });

  @override
  Widget build(BuildContext context) {
    // Initialize bar data
    BarData myBarData = BarData(
      sunAmount: sunAmount,
      monAmount: monAmount,
      tueAmount: tueAmount,
      wedAmount: wedAmount,
      thurAmount: thurAmount,
      friAmount: friAmount,
      satAmount: satAmount,
    );
    myBarData.initializeBarData();

    return BarChart(
        BarChartData(
      maxY: maxY,
      minY: 0,
      titlesData: const FlTitlesData(
        show: true,
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getBottomTitles,// create custom widget for the bottom titles
          ),
        ),

      ),
      gridData: const FlGridData(show: false),// grid lines disappear
      borderData: FlBorderData(show: false),// border line disappears
      barGroups: myBarData.barData
          .map(
            (data) => BarChartGroupData(
          x: data.x,
          barRods: [
            BarChartRodData(
                toY: data.y,
              color: Colors.deepPurple,
              width: 25,
              borderRadius: BorderRadius.circular(4),
              backDrawRodData: BackgroundBarChartRodData(
                show: true,
                toY: maxY,
                color: Colors.purple[200]
              )
            ),
          ],
        ),
      )
          .toList(),
    ));
  }
}

Widget getBottomTitles(double value, TitleMeta meta){
  const style = TextStyle(
    color: Colors.purple,
    fontWeight: FontWeight.bold,
    fontSize: 14
  );
  Widget text;
  switch (value.toInt()){
    case 0:
      text = const Text('SUN', style: style,);
    case 1:
      text = const Text('MON', style: style,);
    case 2:
      text = const Text('TUE', style: style,);
    case 3:
      text = const Text('WED', style: style,);
    case 4:
      text = const Text('THU', style: style,);
    case 5:
      text = const Text('FRI', style: style,);
    case 6:
      text = const Text('SAT', style: style,);
      break;
    default:
      text = const Text('data', style: style,);
  }
      return SideTitleWidget(
          child: text,
          axisSide: meta.axisSide);
}


