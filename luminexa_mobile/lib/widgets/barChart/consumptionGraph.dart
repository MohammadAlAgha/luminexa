import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:luminexa_mobile/widgets/barChart/currentIntensity.dart';

class consumptionGraph extends StatelessWidget {
  final List consumption;

  const consumptionGraph({
    super.key,
    required this.consumption,
  });

  @override
  Widget build(BuildContext context) {
    currentIntensity intensity = currentIntensity(
      IntensityHourOne: consumption[0],
      IntensityHourTwo: consumption[1],
      IntensityHourThree: consumption[2],
      IntensityHourFour: consumption[3],
      IntensityHourFive: consumption[4],
      IntensityHourSix: consumption[5],
      IntensityHourSeven: consumption[6],
    );
    intensity.initializeBarData();

    return Scaffold(
      body: BarChart(
        BarChartData(
          maxY: 20,
          minY: 0,
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(
            show: true,
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
          ),
          borderData: FlBorderData(
            show: true,
            border: Border(
              bottom: BorderSide(
                color: Colors.black,
                width: 2,
              ),
              left: BorderSide(
                color: Colors.black,
                width: 2,
              ),
              top: BorderSide(
                color: Colors.transparent,
                width: 0,
              ),
              right: BorderSide(
                color: Colors.transparent,
                width: 0,
              ),
            ),
          ),
          barGroups: intensity.barData
              .map(
                (data) => BarChartGroupData(
                  x: data.x,
                  barRods: [
                    BarChartRodData(
                      toY: data.y,
                      color: Theme.of(context).primaryColor,
                      width: 20,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                    )
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
