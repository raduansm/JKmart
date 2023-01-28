import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hovering/hovering.dart';
import 'package:jkmart/core/utils/colors.dart';
import 'package:jkmart/screens/home/pages/home_screen.dart';

import '../../../controllers/order_management _controller.dart';

class NewOrderScreen extends GetView<OrderManagementController> {
  NewOrderScreen({Key? key}) : super(key: key);
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Get.to(HomeScreen()),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: CustomColor.secondaryColor,
                      child: Image.asset('assets/images/menu.png', scale: 5),
                    ),
                  ),
                  const Text(
                    'Add New Order ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: const CircleAvatar(
                      radius: 20,
                      backgroundColor: CustomColor.secondaryColor,
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 20,
                        color: Colors.white60,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(
                  color: CustomColor.secondaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 35,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Center(
                      child: Text(
                        'Search product name ',
                        style: TextStyle(
                          color: Color.fromARGB(255, 76, 76, 76),
                          fontSize: 16,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: CustomColor.primaryColor,
                      child: Icon(
                        Icons.camera_alt_outlined,
                        size: 20,
                        color: Colors.white60,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
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
              // Center(
              //     child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceAround,
              //         children: [
              //       Column(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: [
              //             Text(
              //               'Hover Widget Demo',
              //               textScaleFactor: 1.5,
              //             ),
              //             HoverWidget(
              //               hoverChild: Container(
              //                 height: 200,
              //                 width: 200,
              //                 color: Colors.green,
              //                 child: Center(child: Text('Hover Me..')),
              //               ),
              //               onHover: (event) {
              //                 _key.currentState?.showSnackBar(SnackBar(
              //                   content: Text('Yaay! I am Hovered'),
              //                 ));
              //               },
              //               child: Container(
              //                 height: 200,
              //                 width: 200,
              //                 color: Colors.white,
              //                 child: Center(child: Text('Hover Me..')),
              //               ),
              //             )
              //           ]),
              //     ])),
            ],
          ),
        ),
      ),
    );
  }
}
