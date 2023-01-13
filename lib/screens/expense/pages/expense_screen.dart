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
                          const Text(
                            'Expense',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
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
                          children: const [
                            Text(
                              'Total Expense',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '1000 \$',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
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
                            Text(
                              'Amount',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                            height: 40,
                            decoration: BoxDecoration(
                              color: CustomColor.secondaryColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 15.0, right: 15.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    controller.expenses[index].name!,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    controller.expenses[index].date!,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    controller.expenses[index].amount!,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
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
