import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jkmart/controllers/order_management%20_controller.dart';
import 'package:jkmart/core/utils/colors.dart';
import 'package:jkmart/screens/home/widgets/appdrawer.dart';
import 'package:jkmart/screens/order_management/pages/new_order.dart';

class OrderManagementScreen extends GetView<OrderManagementController> {
  const OrderManagementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryColor,
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
                  onTap: () => Get.back(),
                  child: const CircleAvatar(
                    radius: 20,
                    backgroundColor: CustomColor.secondaryColor,
                    child: Padding(
                      padding: EdgeInsets.only(right: 2),
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 20,
                        color: Colors.white60,
                      ),
                    ),
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
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: CustomColor.secondaryColor,
                  ),
                  child: Column(children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            "No name entered",
                            style: Get.textTheme.headline5,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: CustomColor.purple,
                          ),
                          child: Text(
                            "Pending",
                            style: Get.textTheme.subtitle2,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.today,
                              color: Colors.grey.shade400,
                              size: 15,
                            ),
                            SizedBox(width: 5),
                            Text(
                              // DateFormat("dd MMMM yyyy").format(DateTime.tryParse(controller.incomes[index].date ?? "") ?? DateTime.now()),
                              DateFormat("dd MMMM yyyy").format(DateTime.now()),
                              style: Get.textTheme.subtitle2!.copyWith(color: Colors.grey.shade400),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              CupertinoIcons.cube_box,
                              color: Colors.white,
                              size: 19,
                            ),
                            const SizedBox(width: 3),
                            Text(
                              // "\$${controller.incomes[index].amount ?? "0"}",
                              "${23 + index}",
                              textAlign: TextAlign.right,
                              style: Get.textTheme.headline4,
                            ),
                          ],
                        ),
                      ],
                    )
                  ]),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 12);
              },
              itemCount: 5,
            )
          ],
        ),
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