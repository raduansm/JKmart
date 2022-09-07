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
    return points.map((point) => BarChartGroupData(x: point.x.toInt(), barRods: [BarChartRodData(toY: point.y)])).toList();
  }

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        getTitlesWidget: (value, meta) {
          String text = '';
          switch (value.toInt()) {
            // case 0:
            //   text = 'Saturday';
            //   break;
            // case 2:
            //   text = 'Sunday';
            //   break;
            // case 4:
            //   text = 'Monday';
            //   break;
            // case 6:
            //   text = 'Tuesday';
            //   break;
            // case 8:
            //   text = 'Wednesday';
            //   break;
            // case 10:
            //   text = 'Thursday';
            //   break;
            // case 11:
            //   text = 'Friday';
            //   break;
            case 0:
              text = 'A';
              break;
            case 1:
              text = 'B';
              break;
            case 2:
              text = 'C';
              break;
            case 3:
              text = 'D';
              break;
            case 4:
              text = 'E';
              break;
            case 5:
              text = 'F';
              break;
            case 6:
              text = 'G';
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
