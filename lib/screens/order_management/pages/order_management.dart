import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jkmart/controllers/order_management%20_controller.dart';
import 'package:jkmart/core/utils/colors.dart';
import 'package:jkmart/screens/order_management/pages/new_order.dart';

class OrderManagementScreen extends GetView<OrderManagementController> {
  const OrderManagementScreen({Key? key}) : super(key: key);

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
                    Get.to(NewOrderScreen());
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Name',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Date',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: CustomColor.secondaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Name',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Sep 23',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}



























// showDialog(
//                     context: context,
//                     builder: (BuildContext context) {
//                       return AlertDialog(
//                         backgroundColor: CustomColor.secondaryColor,
//                         content: Stack(
//                           children: <Widget>[
//                             Positioned(
//                               right: -40.0,
//                               top: -40.0,
//                               child: InkResponse(
//                                 onTap: () {
//                                   Navigator.of(context).pop();
//                                 },
//                                 child: const CircleAvatar(
//                                   child: Icon(Icons.close),
//                                   backgroundColor: Colors.red,
//                                 ),
//                               ),
//                             ),
//                             Form(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: const [
//                                   Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: Text(
//                                       "Name",
//                                       style: TextStyle(
//                                           color: Colors.white,
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                   ),
//                                   Divider(
//                                     color: Colors.white,
//                                     thickness: 1,
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: Text(
//                                       "Item No: 01",
//                                       style: TextStyle(
//                                           color: Colors.white,
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                   ),
//                                   Divider(
//                                     color: Colors.white,
//                                     thickness: 1,
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: Text(
//                                       "Cost",
//                                       style: TextStyle(
//                                           color: Colors.white,
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                   ),
//                                   Divider(
//                                     color: Colors.white,
//                                     thickness: 1,
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: Text(
//                                       "Sale Price",
//                                       style: TextStyle(
//                                           color: Colors.white,
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                   ),
//                                   Divider(
//                                     color: Colors.white,
//                                     thickness: 1,
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: Text(
//                                       "Items in Stock currently",
//                                       style: TextStyle(
//                                           color: Colors.white,
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//                     })





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