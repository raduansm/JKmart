import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jkmart/controllers/home_controller.dart';
import 'package:jkmart/core/utils/colors.dart';
import 'package:jkmart/core/widgets/global_bottom_button.dart';
import 'package:jkmart/screens/home/widgets/appdrawer.dart';
import 'package:jkmart/screens/home/widgets/drawer_data.dart';
import 'package:jkmart/screens/home/widgets/inventory_home_body.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryColor,
      key: controller.scaffoldKey,
      drawer: const AppDrawer(),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => controller.openDrawer(),
                  child: const CircleAvatar(
                    radius: 25,
                    backgroundColor: CustomColor.secondaryColor,
                    child: Icon(
                      Icons.menu,
                      color: Colors.white60,
                    ),
                  ),
                ),
                Text(
                  'JK MART',
                  style: Get.textTheme.headline5,
                ),
                const CircleAvatar(
                  radius: 25,
                  backgroundColor: CustomColor.secondaryColor,
                  child: Icon(
                    Icons.calendar_month,
                    color: Colors.white60,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                  child: GlobalBottomButton(
                    text: "Weekly",
                    onPressed: () {},
                    isSolidButton: true,
                    color: CustomColor.secondaryColor,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: GlobalBottomButton(
                    text: "Monthly",
                    onPressed: () {},
                    isSolidButton: true,
                    color: CustomColor.secondaryColor,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: GlobalBottomButton(
                    text: "Yealy",
                    onPressed: () {},
                    isSolidButton: true,
                    color: CustomColor.secondaryColor,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Last 7 Days',
                        style: TextStyle(color: CustomColor.secondaryColor, fontSize: 14, fontWeight: FontWeight.w200),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Row(
                        children: const [
                          Text(
                            '341.02',
                            style: TextStyle(color: CustomColor.primaryColor, fontSize: 20, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.circle_outlined,
                            color: Colors.red,
                            size: 10,
                          ),
                          Text(
                            "11%",
                            style: TextStyle(color: Colors.red, fontSize: 14, fontWeight: FontWeight.w200),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text("Avg day", style: Get.textTheme.bodyText1!.copyWith(color: CustomColor.secondaryColor, fontSize: 12, fontWeight: FontWeight.w100)),
                          const SizedBox(height: 5),
                          Text("17", style: Get.textTheme.bodyText1!.copyWith(color: CustomColor.primaryColor, fontSize: 20, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: AspectRatio(
                aspectRatio: 1.5,
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceAround,
                    barGroups: controller.chartGroups(),
                    gridData: FlGridData(show: false),
                    barTouchData: BarTouchData(
                      enabled: true,
                    ),
                    titlesData: FlTitlesData(
                      bottomTitles: AxisTitles(
                        sideTitles: controller.bottomTitles,
                      ),
                      leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    ),
                  ),
                ),
              ),
            ),
            const InventoryHomeBody(),
          ],
        ),
      ),
    );
  }
}
