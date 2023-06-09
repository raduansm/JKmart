import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hovering/hovering.dart';
import 'package:jkmart/core/utils/colors.dart';
import 'package:jkmart/screens/home/pages/home_screen.dart';
import 'package:jkmart/screens/order_management/pages/cart.dart';
import 'package:jkmart/screens/order_management/widgets/add_order_card.dart';

import '../../../controllers/order_management _controller.dart';

class NewOrderScreen extends GetView<OrderManagementController> {
  NewOrderScreen({Key? key}) : super(key: key);
  final _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColor.primaryColor,
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            const SizedBox(height: 25),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: const CircleAvatar(
                    radius: 20,
                    backgroundColor: CustomColor.secondaryColor,
                    child: Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white60,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                const Text(
                  'Add Order ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () => Get.to(CartScreen()),
                  child: const CircleAvatar(
                    radius: 20,
                    backgroundColor: CustomColor.secondaryColor,
                    child: Icon(
                      Icons.shopping_cart_outlined,
                      size: 20,
                      color: Colors.white60,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Column(
              children: [
                Row(
                  children: const [
                    Text(
                      'Selected vendor : ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Google Inc.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const AddOrderCard(
                  title: 'Mobile',
                  title2: '\$25',
                  title3: '12/12/2021',
                  title4: 'Add',
                  icon: Icons.today,
                ),
                const AddOrderCard(
                  title: 'Tab',
                  title2: '\$75',
                  title3: '12/12/2021',
                  title4: 'Add',
                  icon: Icons.today,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
