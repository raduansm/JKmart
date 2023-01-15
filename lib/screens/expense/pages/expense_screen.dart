import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jkmart/controllers/expense_controller.dart';
import 'package:jkmart/core/utils/colors.dart';
import 'package:jkmart/screens/expense/widgets/add_expense_widget.dart';
import 'package:jkmart/screens/home/pages/home_screen.dart';
import 'package:jkmart/screens/home/widgets/appdrawer.dart';

class ExpenseScreen extends GetView<ExpenseController> {
  const ExpenseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColor.primaryColor,
        drawer: const AppDrawer(),
        body: Obx(
          () => SafeArea(
            child: controller.isLoading.value
                ? const Center(
                    child: CupertinoActivityIndicator(),
                  )
                : ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    children: [
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => Get.back(),
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: CustomColor.secondaryColor,
                              child: Image.asset('assets/images/menu.png',
                                  scale: 5),
                            ),
                          ),
                          Text(
                            'Expense',
                            style: Get.textTheme.headline2,
                          ),
                          const AddExpense(),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height: 180,
                        width: 180,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: CustomColor.secondaryColor, width: 10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Total Expense',
                              style: Get.textTheme.headline4,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              '1000 \$',
                              style: Get.textTheme.headline4,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Container(
                                      height: 15,
                                      width: 15,
                                      color: Colors.red,
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      "Pull tab payout",
                                      style: Get.textTheme.headline5,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Container(
                                      height: 15,
                                      width: 15,
                                      color: Colors.blue,
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      "Pull tab payout",
                                      style: Get.textTheme.headline5,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Name',
                              style: Get.textTheme.headline5,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 30),
                              child: Text(
                                'Date',
                                style: Get.textTheme.headline5,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 0),
                              child: Text(
                                'Amount',
                                style: Get.textTheme.headline5,
                              ),
                            ),
                            Text(
                              'Type',
                              style: Get.textTheme.headline5,
                            ),
                          ],
                        ),
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                            // height: 40,
                            decoration: BoxDecoration(
                              color: CustomColor.secondaryColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 15.0, right: 15.0),
                              child: Row(
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      controller.expenses[index].name!,
                                      // "REDWAN KHONDOKAR SAHA ALI RAHMAN",
                                      style: Get.textTheme.subtitle1,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "13-02-22",
                                      style: Get.textTheme.subtitle1,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      controller.expenses[index].amount!,
                                      style: Get.textTheme.subtitle1,
                                    ),
                                  ),
                                  Container(
                                    height: 15,
                                    width: 15,
                                    color: Colors.red,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 5);
                        },
                        itemCount: controller.expenses.length,
                      ),
                    ],
                  ),
          ),
        ));
  }
}
