import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jkmart/core/error/failures.dart';
import 'package:jkmart/data/models/expense_model.dart';
import 'package:jkmart/data/repositories/expense_repository.dart';

class ExpenseController extends GetxController {
  final ExpenseRepository repository;

  ExpenseController({required this.repository});
  final String collectionId = "634f40a9c1be74eb6ae6";
  final String databaseId = "62dc4ad195fe6c0fe8c5";

  List<ExpenseModel> expenses = [];

  ///This veriable shows if api is getting data
  RxBool isLoading = false.obs;

  ///This veriable shows if api is creating a new expense data
  RxBool isAddingExpense = false.obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  Rx<DateTime> selectedDate = DateTime.now().obs;

  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();

    getExpenses();
  }

  void updateDate(DateTime date) {
    selectedDate.value = date;
    update();
  }

  String? addExpenseFieldsValidator(value) {
    if (value!.isEmpty) {
      return "This field is required";
    } else if (int.tryParse(value) == null) {
      return "Please enter number only. Example: 27";
    } else {
      return null;
    }
  }

  Future<void> getExpenses() async {
    isLoading.value = true;

    final result = await repository.getExpenses();

    result.fold((l) {
      if (l is NoConnectionFailure) {
        Get.snackbar("No connection", "Please check your internet connection");
      } else {
        Get.snackbar("Something went wrong", "Please try again later");
      }
    }, (r) {
      expenses = r;
    });

    isLoading.value = false;
  }

  Future<void> addExpense() async {
    if (!formKey.currentState!.validate()) return;

    isAddingExpense.value = true;

    final result = await repository.addExpense(
      name: nameController.text,
      date: dateController.text,
      amount: amountController.text,
    );

    result.fold((l) {
      Get.back();
      if (l is NoConnectionFailure) {
        Get.snackbar("No connection", "Please check your internet connection");
      } else {
        Get.snackbar("Something went wrong", "Please try again later");
      }
    }, (r) {
      getExpenses();
      Get.back();
      Get.snackbar("Expense added", 'New expense added successfully');
    });

    isAddingExpense.value = false;
  }
}
