import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../data/models/hero_model.dart';

class HeroStatsChart extends StatelessWidget {
  final HeroStats stats;
  const HeroStatsChart({super.key, required this.stats});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: RadarChart(
        RadarChartData(
          dataSets: [
            RadarDataSet(
              // ignore: deprecated_member_use
              fillColor: Colors.purple.withOpacity(0.4),
              borderColor: Colors.purple,
              entryRadius: 3,
              dataEntries: [
                RadarEntry(value: stats.damage), RadarEntry(value: stats.durability),
                RadarEntry(value: stats.crowdControl), RadarEntry(value: stats.mobility),
                RadarEntry(value: stats.difficulty),
              ],
            ),
          ],
          getTitle: (index, angle) {
            final titles = ['DMG', 'SUS', 'CC', 'MOB', 'DIFF'];
            return RadarChartTitle(text: titles[index], angle: angle);
          },
          tickCount: 5,
          gridBorderData: const BorderSide(color: Colors.white10),
        ),
      ),
    );
  }
}