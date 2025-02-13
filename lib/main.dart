import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'fl_chart Example',
      home: const ChartPage(),
    );
  }
}

class ChartPage extends StatelessWidget {
  const ChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Line Chart Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: LineChart(
          LineChartData(
            // Draw grid lines on the chart for a nice background effect.
            gridData: FlGridData(show: true),
            // Display axis titles (numbers) on the left and bottom.
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: true),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: true),
              ),
            ),
            // Add a border around the chart.
            borderData: FlBorderData(
              show: true,
              border: Border.all(color: Colors.blue),
            ),
            // Define the data and appearance of the line.
            lineBarsData: [
              LineChartBarData(
                spots: const [
                  FlSpot(0, 1),
                  FlSpot(1, 3),
                  FlSpot(2, 7),
                  FlSpot(3, 6),
                  FlSpot(4, 8),
                ],
                isCurved: true, // Makes the line smooth.
                barWidth: 4, // Thickness of the line.
                color: Colors.blue, // Color of the line.
                dotData: FlDotData(show: true), // Show dots on data points.
                belowBarData: BarAreaData(
                  show: true,
                  color: Colors.blue
                      .withOpacity(0.3), // Fills the area under the line.
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
