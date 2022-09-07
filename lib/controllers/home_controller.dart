import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jkmart/screens/home/widgets/pricepoint.dart';

class HomeController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  List<PricePoint> points = [
    PricePoint(x: 1, y: 10),
    PricePoint(x: 2, y: 3),
    PricePoint(x: 3, y: 5),
    PricePoint(x: 4, y: 9),
    PricePoint(x: 5, y: 8),
    PricePoint(x: 6, y: 2),
    PricePoint(x: 7, y: 11),
  ];

  List<BarChartGroupData> chartGroups() {
    return points
        .map((point) => BarChartGroupData(
            x: point.x.toInt(), barRods: [BarChartRodData(toY: point.y)]))
        .toList();
  }

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        getTitlesWidget: (value, meta) {
          String text = '';
          switch (value.toInt()) {
            case 1:
              text = 'Sun';
              break;
            case 2:
              text = 'Mon';
              break;
            case 3:
              text = 'Tue';
              break;
            case 4:
              text = 'Wed';
              break;
            case 5:
              text = 'Thu';
              break;
            case 6:
              text = 'Fri';
              break;
            case 7:
              text = 'Sat';
              break;
          }

          return Text(text);
        },
      );

  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }

  void closeDrawer() {
    scaffoldKey.currentState!.openEndDrawer();
  }
}
