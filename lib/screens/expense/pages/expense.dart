import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jkmart/controllers/expense_controller.dart';
import 'package:jkmart/core/utils/colors.dart';
import 'package:jkmart/screens/expense/pages/new_expanse.dart';
import 'package:jkmart/screens/home/pages/home_screen.dart';

class ExpenseScreen extends GetView<ExpenseController> {
  const ExpenseScreen({Key? key}) : super(key: key);
  //  void _showDatePicker() {
  //   showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(2000),
  //     lastDate: DateTime(2025),
  //   ).then((value) {
  //     setState(() {
  //       _dateTime = value!;
  //     });
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: CustomColor.primaryColor,
          body: ListView(
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
                      child: Image.asset('assets/images/menu.png', scale: 5),
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
                  GestureDetector(
                    onTap: () {
                      Get.to(NewExpanseScreen());
                    },
                    child: const CircleAvatar(
                      radius: 20,
                      backgroundColor: CustomColor.secondaryColor,
                      child: Icon(
                        Icons.add,
                        size: 25,
                        color: Colors.white60,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: Text("Select Date for expense",
                    style: Get.textTheme.headline4!
                        .copyWith(color: CustomColor.white)),
              ),
              const SizedBox(height: 20),
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: CustomColor.secondaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text("2020-12-12",
                      style: Get.textTheme.headline4!
                          .copyWith(color: CustomColor.white)),
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
                  ],
                ),
              ),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  color: CustomColor.secondaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Name of Expense",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Sep 23 ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
