import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jkmart/screens/home/widgets/pricepoint.dart';

class HomeController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  List<PricePoint> points = [PricePoint(x: 4, y: 10), PricePoint(x: 5, y: 10)];

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
            case 0:
              text = 'Saturday';
              break;
            case 2:
              text = 'Mar';
              break;
            case 4:
              text = 'May';
              break;
            case 6:
              text = 'Jul';
              break;
            case 8:
              text = 'Sep';
              break;
            case 10:
              text = 'Nov';
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
