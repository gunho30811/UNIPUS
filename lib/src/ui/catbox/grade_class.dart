import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../provider/catbox_grade_provider.dart';

class ChartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final itemProvider = Provider.of<ItemProvider>(context);
    final items = itemProvider.itemsByMonth(DateTime.now().month);

    // Calculate the grade counts
    int excellentCount = items.where((item) => item.grade == 'excellent').length;
    int goodCount = items.where((item) => item.grade == 'good').length;
    int badCount = items.where((item) => item.grade == 'bad').length;
    int totalCount = items.length;

    // Calculate the grade percentages
    double excellentPercentage = totalCount > 0 ? (excellentCount / totalCount) * 100 : 0;
    double goodPercentage = totalCount > 0 ? (goodCount / totalCount) * 100 : 0;
    double badPercentage = totalCount > 0 ? (badCount / totalCount) * 100 : 0;

    // Display the charts using the data
    return Scaffold(
      appBar: AppBar(
        title: Text('Charts'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Bar chart
            Text('Bar Chart', style: TextStyle(fontSize: 24)),
            Container(
              height: 200,
              child: BarChart(
                BarChartData(
                  barGroups: [
                    BarChartGroupData(
                      x: 0,
                      barRods: [
                        BarChartRodData(
                          y: excellentPercentage,
                          colors: [Colors.green],
                        ),
                      ],
                    ),
                    BarChartGroupData(
                      x: 1,
                      barRods: [
                        BarChartRodData(
                          y: goodPercentage,
                          colors: [Colors.yellow],
                        ),
                      ],
                    ),
                    BarChartGroupData(
                      x: 2,
                      barRods: [
                        BarChartRodData(
                          y: badPercentage,
                          colors: [Colors.red],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 32),
            // Pie chart
            Text('Pie Chart', style: TextStyle(fontSize: 24)),
            Container(
              height: 200,
              child: PieChart(
                PieChartData(
                  sections: [
                    PieChartSectionData(
                      value: excellentPercentage,
                      color: Colors.green,
                      title: 'Excellent',
                    ),
                    PieChartSectionData(
                      value: goodPercentage,
                      color: Colors.yellow,
                      title: 'Good',
                    ),
                    PieChartSectionData(
                      value: badPercentage,
                      color: Colors.red,
                      title: 'Bad',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
