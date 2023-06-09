import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jkmart/core/utils/colors.dart';
import 'package:jkmart/screens/order_management/pages/cart.dart';

class AddOrderCard extends StatelessWidget {
  final String title;
  final String title2;
  final String title3;
  final String title4;
  final IconData icon;

  // final List<Widget> rowChildren;

  const AddOrderCard({
    required this.title,
    required this.title2,
    required this.title3,
    required this.title4,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: CustomColor.secondaryColor,
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: CustomColor.white),
                ),
                Text(
                  title2,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: CustomColor.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Row(
                children: [
                  Icon(icon, color: CustomColor.white, size: 20),
                  const SizedBox(width: 10),
                  Text(
                    title3,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: CustomColor.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (BuildContext context) {
                      return CupertinoActionSheet(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Mobile',
                                  style: Get.textTheme.subtitle1,
                                ),
                                Text(
                                  'Base Price: \$25',
                                  style: Get.textTheme.subtitle2,
                                ),
                              ],
                            ),
                            Text(
                              '\$50',
                              style: Get.textTheme.headline2,
                            ),
                          ],
                        ),
                        actions: [
                          CupertinoActionSheetAction(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.yellow,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Icon(Icons.remove,
                                      color: CustomColor.white),
                                ),
                                const Text('2',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 28,
                                        color: CustomColor.white)),
                                Container(
                                    decoration: BoxDecoration(
                                      color: Colors.yellow,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Icon(Icons.add,
                                        color: Colors.white)),
                              ],
                            ),
                            onPressed: () {
                              // Handle Option 1 selection
                              // Get.to(NewOrderScreen());
                            },
                          ),
                        ],
                        cancelButton: CupertinoActionSheetAction(
                          child: const Text('ADD'),
                          onPressed: () {
                            // Handle cancel selection
                            Get.to(CartScreen());
                          },
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 8, right: 8, top: 3, bottom: 3),
                  decoration: BoxDecoration(
                    color: CustomColor.green,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    title4,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: CustomColor.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
