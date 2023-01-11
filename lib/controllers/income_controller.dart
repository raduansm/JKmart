import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jkmart/core/error/failures.dart';
import 'package:jkmart/data/repositories/income_repository.dart';
import 'package:jkmart/data/repositories/lottery_repository.dart';
import 'package:jkmart/data/models/income_model.dart';

class IncomeController extends GetxController {
  final IncomeRepository repository;

  IncomeController({required this.repository});

  List<IncomeModel> incomes = [];
  RxBool isLoading = false.obs;
  RxBool isAddingIncome = false.obs;

  TextEditingController vendorController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    getIncomes();
  }

  Future<void> getIncomes() async {
    isLoading.value = true;

    final result = await repository.getIncomes();

    result.fold((l) {
      if (l is NoConnectionFailure) {
        Get.snackbar("No connection", "Please check your internet connection");
      }
    }, (r) {
      incomes = r;
    });

    isLoading.value = false;
  }

  Future<void> addIncome() async {
    isAddingIncome.value = true;

    final result = await repository.addIncome(
        vendor: vendorController.text,
        date: dateController.text,
        amount: amountController.text);

    result.fold((l) {
      Get.back();
      if (l is NoConnectionFailure) {
        Get.snackbar("No connection", "Please check your internet connection");
      } else {
        Get.snackbar("Something went wrong", "Please try again later");
      }
    }, (r) {
      getIncomes();
      Get.back();
      Get.snackbar("Income added", 'New income added successfully');
    });

    isAddingIncome.value = false;
  }
}
