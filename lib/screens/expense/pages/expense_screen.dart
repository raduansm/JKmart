import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jkmart/controllers/auth_controller.dart';
import 'package:jkmart/controllers/expense_controller.dart';
import 'package:jkmart/core/utils/colors.dart';
import 'package:jkmart/screens/expense/widgets/add_expense_widget.dart';
import 'package:jkmart/screens/expense/widgets/expense_filter.dart';
import 'package:jkmart/screens/home/widgets/appdrawer.dart';

class ExpenseScreen extends GetView<ExpenseController> {
  ExpenseScreen({Key? key}) : super(key: key);

  final authController = Get.find<AuthController>();

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
                : ListView(padding: const EdgeInsets.symmetric(horizontal: 20), children: [
                    const SizedBox(height: 20),
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
                        Text(
                          'Expenses',
                          style: Get.textTheme.headline2,
                        ),
                        authController.currentUser!.name == authController.userTypes[0] ? const AddExpense() : const SizedBox(height: 20, width: 20),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const ExpenseFilterWidget(),
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
                                    controller.generatedVendors[index].name ?? "No name entered",
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
                                    controller.generatedExpenseTypes[index].name ?? "Undefined",
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
                                    const SizedBox(width: 5),
                                    Text(
                                      DateFormat("dd MMMM yyyy").format(DateTime.tryParse(controller.expenses[index].date ?? "") ?? DateTime.now()),
                                      style: Get.textTheme.subtitle2!.copyWith(color: Colors.grey.shade400),
                                    ),
                                  ],
                                ),
                                Text(
                                  "\$${controller.expenses[index].amount ?? "0"}",
                                  textAlign: TextAlign.right,
                                  style: Get.textTheme.headline4,
                                ),
                              ],
                            )
                          ]),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 12);
                      },
                      itemCount: controller.expenses.length,
                    ),
                  ]),
          ),
        ));
  }
}
