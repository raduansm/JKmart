import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jkmart/core/utils/colors.dart';
import 'package:jkmart/initial_binding.dart';
import 'package:jkmart/screens/expense/pages/expense.dart';
import 'package:jkmart/screens/home/widgets/drawer_data.dart';
import 'package:jkmart/screens/income/pages/income_screen.dart';
import 'package:jkmart/screens/lottery/pages/lottery_screen.dart';
import 'package:jkmart/screens/order_management/pages/order_management.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 110, 20, 0),
        color: CustomColor.secondaryColor,
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Mr. X',
                    style: Get.textTheme.headline4,
                  ),
                ),
                const Divider(
                  thickness: 2,
                  color: Colors.white,
                ),

                DrawerTile(
                  // imagePath: 'images/delivery_man.png',
                  textData: 'Order Management',
                  width: 12,
                  onTap: () {
                    Get.to(() => const OrderManagementScreen());
                  },
                ),
                DrawerTile(
                  // imagePath: 'images/delivery_man.png',
                  textData: 'Expense',
                  width: 12,
                  onTap: () {
                    Get.to(() => const ExpenseScreen());
                  },
                ),
                DrawerTile(
                  // imagePath: 'images/delivery_man.png',
                  textData: 'Lottery',
                  width: 12,
                  onTap: () {
                    Get.to(() => const LotteryScreen(), binding: InitialBinding());
                  },
                ),
                DrawerTile(
                  // imagePath: 'images/delivery_man.png',
                  textData: 'Income',
                  width: 12,
                  onTap: () {
                    Get.to(() => const IncomeScreen());
                  },
                ),
                // drawer_data(
                //   imagePath: 'images/delivery_man.png',
                //   textData: 'Contact',
                //   width: 2,
                //   onTap: () {
                //     // Navigator.push(context, CupertinoPageRoute(builder: (_) => ContactPage()));
                //   },
                // ),
              ],
            ),
            Positioned(
              bottom: 60.0,
              child: DrawerTile(
                // imagePath: 'images/delivery_man.png',
                textData: 'LOG OUT',
                width: 10,
                onTap: () {
                  // BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
                  print("Pressed! Logout!");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
