import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:isp_app/constants.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text('Statistics', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Card(
                color: Colors.grey[850],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Monthly Data',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 200,
                        child: LineChart(
                          LineChartData(
                            gridData: const FlGridData(show: true),
                            titlesData: const FlTitlesData(show: true),
                            borderData: FlBorderData(
                              show: true,
                              border: const Border(
                                bottom:
                                    BorderSide(color: Colors.white, width: 1),
                                left: BorderSide(color: Colors.white, width: 1),
                              ),
                            ),
                            lineBarsData: [
                              LineChartBarData(
                                isCurved: true,
                                color: Colors.blue,
                                barWidth: 4,
                                dotData: const FlDotData(show: false),
                                belowBarData: BarAreaData(show: false),
                                spots: [
                                  const FlSpot(0, 3),
                                  const FlSpot(1, 1),
                                  const FlSpot(2, 4),
                                  const FlSpot(3, 3.5),
                                  const FlSpot(4, 5),
                                  const FlSpot(5, 3),
                                  const FlSpot(6, 4),
                                ],
                              ),
                              LineChartBarData(
                                isCurved: true,
                                color: Colors.green,
                                barWidth: 4,
                                dotData: const FlDotData(show: false),
                                belowBarData: BarAreaData(show: false),
                                spots: [
                                  const FlSpot(0, 2),
                                  const FlSpot(1, 3),
                                  const FlSpot(2, 2),
                                  const FlSpot(3, 4),
                                  const FlSpot(4, 3),
                                  const FlSpot(5, 5),
                                  const FlSpot(6, 4),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Card(
                color: Colors.grey[850],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Statistics Table',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      DataTable(
                        columns: const [
                          DataColumn(
                            label: Text(
                              'Upload',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Download',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Ping',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                        rows: const [
                          DataRow(
                            cells: [
                              DataCell(
                                Text(
                                  '10 Mbps',
                                  style: TextStyle(color: Colors.white),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              DataCell(
                                Text(
                                  '50 Mbps',
                                  style: TextStyle(color: Colors.white),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              DataCell(
                                Text(
                                  '20 ms',
                                  style: TextStyle(color: Colors.white),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(
                                Text(
                                  '15 Mbps',
                                  style: TextStyle(color: Colors.white),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              DataCell(
                                Text(
                                  '45 Mbps',
                                  style: TextStyle(color: Colors.white),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              DataCell(
                                Text(
                                  '18 ms',
                                  style: TextStyle(color: Colors.white),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(
                                Text(
                                  '20 Mbps',
                                  style: TextStyle(color: Colors.white),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              DataCell(
                                Text(
                                  '30 Mbps',
                                  style: TextStyle(color: Colors.white),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              DataCell(
                                Text(
                                  '12 ms',
                                  style: TextStyle(color: Colors.white),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(
                                Text(
                                  '18 Mbps',
                                  style: TextStyle(color: Colors.white),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              DataCell(
                                Text(
                                  '35 Mbps',
                                  style: TextStyle(color: Colors.white),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              DataCell(
                                Text(
                                  '9 ms',
                                  style: TextStyle(color: Colors.white),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
