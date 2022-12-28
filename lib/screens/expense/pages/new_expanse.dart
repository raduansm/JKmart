import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hovering/hovering.dart';
import 'package:jkmart/controllers/expense_controller.dart';
import 'package:jkmart/core/utils/colors.dart';
import 'package:jkmart/screens/home/pages/home_screen.dart';

import '../../../controllers/order_management _controller.dart';

class NewExpanseScreen extends GetView<ExpenseController> {
  NewExpanseScreen({Key? key}) : super(key: key);
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
                      onTap: () => Get.to(const HomeScreen()),
                      child: const CircleAvatar(
                        radius: 20,
                        backgroundColor: CustomColor.secondaryColor,
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 20,
                          color: Colors.white60,
                        ),
                      )),
                  const Text(
                    'Add New Expanse ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: CustomColor.secondaryColor,
                              content: Stack(
                                children: <Widget>[
                                  Positioned(
                                    right: -40.0,
                                    top: -40.0,
                                    child: InkResponse(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const CircleAvatar(
                                        child: Icon(Icons.close),
                                        backgroundColor: Colors.red,
                                      ),
                                    ),
                                  ),
                                  Form(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Name",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Divider(
                                          color: Colors.white,
                                          thickness: 1,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Item No: 01",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Divider(
                                          color: Colors.white,
                                          thickness: 1,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Cost",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Divider(
                                          color: Colors.white,
                                          thickness: 1,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Sale Price",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Divider(
                                          color: Colors.white,
                                          thickness: 1,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            "Items in Stock currently",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });
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
