import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jkmart/controllers/auth_controller.dart';
import 'package:jkmart/controllers/income_controller.dart';
import 'package:jkmart/core/utils/colors.dart';
import 'package:jkmart/core/widgets/global_bottom_button.dart';
import 'package:jkmart/screens/home/widgets/appdrawer.dart';
import 'package:jkmart/screens/income/widgets/add_incomes.dart';

class IncomeScreen extends GetView<IncomeController> {
  IncomeScreen({Key? key}) : super(key: key);

  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryColor,
      // key: controller.scaffoldKey,
      // drawer: const AppDrawer(),
      body: Obx(
        () => SafeArea(
          child: controller.isLoading.value
              ? const Center(
                  child: CupertinoActivityIndicator(),
                )
              : ListView(padding: const EdgeInsets.symmetric(horizontal: 20), children: [
                  const SizedBox(height: 20),
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
                      Text(
                        'Income',
                        style: Get.textTheme.headline2,
                      ),
                      authController.currentUser!.name == authController.userTypes[0] ? const AddIncome() : const SizedBox(height: 20, width: 20),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 20.0, right: 15.0, top: 10.0, bottom: 10.0),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Text(
                  //         'Name',
                  //         style: Get.textTheme.headline5,
                  //       ),
                  //       Padding(
                  //         padding: const EdgeInsets.only(left: 15.0),
                  //         child: Text(
                  //           'Amount',
                  //           style: Get.textTheme.headline5,
                  //         ),
                  //       ),
                  //       Padding(
                  //         padding: const EdgeInsets.only(right: 15.0),
                  //         child: Text(
                  //           'Date',
                  //           style: Get.textTheme.headline5,
                  //         ),
                  //       ),
                  //       Padding(
                  //         padding: const EdgeInsets.only(right: 10.0),
                  //         child: Text(
                  //           'Type',
                  //           style: Get.textTheme.headline5,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
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
                                  controller.incomes[index].vendor ?? "No name entered",
                                  style: Get.textTheme.headline5,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: CustomColor.primaryColor,
                                ),
                                child: Text(
                                  controller.incomes[index].type ?? "Undefined",
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
                                    DateFormat("dd MMMM yyyy").format(DateTime.tryParse(controller.incomes[index].date ?? "") ?? DateTime.now()),
                                    style: Get.textTheme.subtitle2!.copyWith(color: Colors.grey.shade400),
                                  ),
                                ],
                              ),
                              Text(
                                "\$${controller.incomes[index].amount ?? "0"}",
                                textAlign: TextAlign.right,
                                style: Get.textTheme.headline4,
                              ),
                            ],
                          )
                        ]),
                      );
                      // return Container(
                      //   decoration: BoxDecoration(
                      //     color: CustomColor.secondaryColor,
                      //     borderRadius: BorderRadius.circular(8),
                      //   ),
                      //   padding: const EdgeInsets.symmetric(vertical: 10),
                      //   child: Padding(
                      //     padding: const EdgeInsets.only(left: 20.0, right: 15.0),
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //       children: [
                      //         Expanded(
                      //           child: Text(
                      //             controller.incomes[index].vendor!,
                      //             style: Get.textTheme.subtitle1,
                      //           ),
                      //         ),
                      //         Expanded(
                      //           child: Padding(
                      //             padding: const EdgeInsets.only(left: 15.0),
                      //             child: Text(controller.incomes[index].amount!, style: Get.textTheme.subtitle1),
                      //           ),
                      //         ),
                      //         Expanded(
                      //           child: Padding(
                      //             padding: const EdgeInsets.only(left: 30.0),
                      //             child: Text(controller.incomes[index].date!, style: Get.textTheme.subtitle1),
                      //           ),
                      //         ),
                      //         Expanded(
                      //           child: Padding(
                      //             padding: const EdgeInsets.only(left: 35.0),
                      //             child: Text(controller.incomes[index].type!, style: Get.textTheme.subtitle1),
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 12);
                    },
                    itemCount: controller.incomes.length,
                  ),
                ]),
        ),
      ),
    );
  }
}
