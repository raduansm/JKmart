import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jkmart/controllers/order_management%20_controller.dart';
import 'package:jkmart/core/utils/colors.dart';
import 'package:jkmart/screens/home/widgets/appdrawer.dart';
import 'package:jkmart/screens/order_management/pages/new_order.dart';
import 'package:jkmart/screens/order_management/widgets/order_card.dart';

class OrderManagementScreen extends GetView<OrderManagementController> {
  const OrderManagementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryColor,
      drawer: const AppDrawer(),
      body: SafeArea(
        child: Container(
            child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: CustomColor.secondaryColor,
                    child: Image.asset('assets/images/menu.png', scale: 5),
                  ),
                ),
                const Text(
                  'Order ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Get.to(NewOrderScreen());
                    showCupertinoModalPopup(
                      context: context,
                      builder: (BuildContext context) {
                        return CupertinoActionSheet(
                          title: Text(
                            'Select a Vendor',
                            style: Get.textTheme.headline4,
                          ),
                          actions: [
                            CupertinoActionSheetAction(
                              child: Text('Google Inc.', style: Get.textTheme.bodyText1),
                              onPressed: () {
                                // Handle Option 1 selection
                                Get.to(NewOrderScreen());
                              },
                            ),
                          ],
                          cancelButton: CupertinoActionSheetAction(
                            child: Text('Cancel'),
                            onPressed: () {
                              // Handle cancel selection
                              Navigator.pop(context);
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
                      Icons.add,
                      size: 20,
                      color: Colors.white60,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              children: const [
                OrderCard(
                  title: 'Google Inc.',
                  title2: 'Pending',
                  title3: '12/12/2021',
                  title4: '\$25',
                  icon: Icons.today,
                ),
                OrderCard(
                  title: 'Google Inc.',
                  title2: 'Copmleted',
                  title3: '12/12/2021',
                  title4: '\$75',
                  icon: Icons.today,
                ),
                // Text(
                //   'Incomes',
                //   style: Get.textTheme.subtitle1,
                // ),
              ],
            )
          ],
        )),
      ),
    );
  }
}






























                  // onTap: () {
                  //   showDialog(
                  //       context: context,
                  //       builder: (BuildContext context) {
                  //         return AlertDialog(
                  //           backgroundColor: CustomColor.secondaryColor,
                  //           content: Stack(
                  //             children: <Widget>[
                  //               Positioned(
                  //                 right: -40.0,
                  //                 top: -40.0,
                  //                 child: InkResponse(
                  //                   onTap: () {
                  //                     Navigator.of(context).pop();
                  //                   },
                  //                   child: const CircleAvatar(
                  //                     child: Icon(Icons.close),
                  //                     backgroundColor: Colors.red,
                  //                   ),
                  //                 ),
                  //               ),
                  //               Form(
                  //                 child: Column(
                  //                   mainAxisSize: MainAxisSize.min,
                  //                   children: const [
                  //                     Padding(
                  //                       padding: const EdgeInsets.all(8.0),
                  //                       child: Text(
                  //                         "Add New Order",
                  //                         style: TextStyle(
                  //                             color: Colors.white,
                  //                             fontSize: 16,
                  //                             fontWeight: FontWeight.bold),
                  //                       ),
                  //                     ),
                  //                     Divider(
                  //                       color: Colors.white,
                  //                       thickness: 1,
                  //                     ),
                  //                     Padding(
                  //                       padding: const EdgeInsets.all(8.0),
                  //                       child: Text(
                  //                         "Filter",
                  //                         style: TextStyle(
                  //                             color: Colors.white,
                  //                             fontSize: 16,
                  //                             fontWeight: FontWeight.bold),
                  //                       ),
                  //                     ),
                  //                     Divider(
                  //                       color: Colors.white,
                  //                       thickness: 1,
                  //                     ),
                  //                     Padding(
                  //                       padding: const EdgeInsets.all(8.0),
                  //                       child: Text(
                  //                         "Add New Order",
                  //                         style: TextStyle(
                  //                             color: Colors.white,
                  //                             fontSize: 16,
                  //                             fontWeight: FontWeight.bold),
                  //                       ),
                  //                     ),
                  //                     Divider(
                  //                       color: Colors.white,
                  //                       thickness: 1,
                  //                     ),
                  //                     Padding(
                  //                       padding: const EdgeInsets.all(8.0),
                  //                       child: Text(
                  //                         "Edit Order",
                  //                         style: TextStyle(
                  //                             color: Colors.white,
                  //                             fontSize: 16,
                  //                             fontWeight: FontWeight.bold),
                  //                       ),
                  //                     ),
                  //                   ],
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         );
                  //       });
                  // },