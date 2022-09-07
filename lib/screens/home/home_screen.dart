import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jkmart/controllers/home_controller.dart';
import 'package:jkmart/core/utils/colors.dart';
import 'package:jkmart/screens/home/widgets/appdrawer.dart';
import 'package:jkmart/screens/home/widgets/drawer_data.dart';

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
            )
          ],
        ),
      ),
    );
  }
}
