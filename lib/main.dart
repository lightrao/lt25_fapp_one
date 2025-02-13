import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Treasure Map Chart')),
        body: TreasureChart(),
      ),
    );
  }
}

class TreasureChart extends StatelessWidget {
  // Our treasure spots (data points)
  final List<FlSpot> buriedTreasures = [
    FlSpot(1, 3), // Month 1: 3 gold coins
    FlSpot(2, 1), // Month 2: 1 gold coin
    FlSpot(3, 4), // Month 3: 4 gold coins
    FlSpot(4, 2), // Month 4: 2 gold coins
    FlSpot(5, 5), // Month 5: 5 gold coins
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: 300,
      child: LineChart(
        LineChartData(
          // X Axis (Time Road)
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) =>
                    Text('Month ${value.toInt()}'),
                interval: 1,
              ),
            ),
            // Y Axis (Gold Coast)
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) => Text('${value.toInt()}'),
                interval: 1,
              ),
            ),
          ),
          // Grid lines (Map's grid)
          gridData: FlGridData(show: true),
          // The treasure path line
          lineBarsData: [
            LineChartBarData(
              spots: buriedTreasures,
              isCurved: true,
              color: Colors.amber,
              dotData: FlDotData(show: true),
            ),
          ],
        ),
      ),
    );
  }
}
