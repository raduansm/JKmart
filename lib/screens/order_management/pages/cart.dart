import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hovering/hovering.dart';
import 'package:jkmart/core/utils/colors.dart';
import 'package:jkmart/screens/home/pages/home_screen.dart';
import 'package:jkmart/screens/order_management/pages/order_management.dart';
import 'package:jkmart/screens/order_management/widgets/add_order_card.dart';
import 'package:jkmart/screens/order_management/widgets/cart_card.dart';

import '../../../controllers/order_management _controller.dart';

class CartScreen extends GetView<OrderManagementController> {
  CartScreen({Key? key}) : super(key: key);
  final _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColor.primaryColor,
        body: Container(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              const SizedBox(height: 25),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Get.to(HomeScreen()),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: CustomColor.secondaryColor,
                      child: Image.asset('assets/images/menu.png', scale: 5),
                    ),
                  ),
                  Spacer(),
                  const Text(
                    'Cart',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      showCupertinoModalPopup(
                        context: context,
                        builder: (BuildContext context) {
                          return CupertinoActionSheet(
                            actions: [
                              CupertinoActionSheetAction(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: const [
                                    Text('Total',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: CustomColor.primaryColor)),
                                    Text('\$150',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 28,
                                            color: CustomColor.primaryColor)),
                                  ],
                                ),
                                onPressed: () {
                                  // Handle Option 1 selection
                                  // Get.to(NewOrderScreen());
                                },
                              ),
                            ],
                            cancelButton: CupertinoActionSheetAction(
                              child: const Text(
                                'Confirm',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    color: CustomColor.primaryColor),
                              ),
                              onPressed: () {
                                // Handle cancel selection
                                Get.to(OrderManagementScreen());
                              },
                            ),
                          );
                        },
                      );
                    },
                    child: const CircleAvatar(
                      radius: 20,
                      backgroundColor: CustomColor.secondaryColor,
                      child: Icon(
                        Icons.select_all,
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
                  const CartCard(
                    title: 'Mobile',
                    title2: '\$150',
                    title3: '2',
                    title4: 'Add',
                    title5: 'Delete',
                    icon: Icons.countertops,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
