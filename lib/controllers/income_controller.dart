import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jkmart/core/error/failures.dart';
import 'package:jkmart/data/models/payment_type_model.dart';
import 'package:jkmart/data/models/vendor_model.dart';
import 'package:jkmart/data/repositories/income_repository.dart';
import 'package:jkmart/data/repositories/lottery_repository.dart';
import 'package:jkmart/data/models/income_model.dart';

class IncomeController extends GetxController {
  final IncomeRepository repository;

  IncomeController({required this.repository});

  //List of all lotteries from server
  List<IncomeModel> incomes = [];
  List<VendorModel> vendors = [];
  List<PaymentTypeModel> paymentTypes = [];

  //These variables are generated list for showing in UI
  List<VendorModel> generatedVendors = [];
  List<PaymentTypeModel> generatedPaymentTypes = [];

  RxBool isLoading = false.obs;
  RxBool isAddingIncome = false.obs;

  TextEditingController vendorController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  Rx<DateTime> selectedDate = DateTime.now().obs;

  @override
  void onInit() {
    super.onInit();

    getIncomes();
  }

  void updateDate(DateTime date) {
    selectedDate.value = date;
    update();
  }

  String? addIncomeFieldsValidator(value) {
    if (value!.isEmpty) {
      return "This field is required";
    } else if (int.tryParse(value) == null) {
      return "Please enter number only. Example: 27";
    } else {
      return null;
    }
  }

  Future<void> getVendors() async {
    final result = await repository.getVendors();

    result.fold((l) {
      if (l is NoConnectionFailure) {
        Get.snackbar("No connection", "Please check your internet connection");
      }
    }, (r) {
      vendors = r;
    });
  }

  Future<void> getPaymentTypes() async {
    final result = await repository.getPaymentTypes();

    result.fold((l) {
      if (l is NoConnectionFailure) {
        Get.snackbar("No connection", "Please check your internet connection");
      }
    }, (r) {
      paymentTypes = r;
    });
  }

  Future<void> getIncomes() async {
    isLoading.value = true;

    await getVendors();
    await getPaymentTypes();

    final result = await repository.getIncomes();

    result.fold((l) {
      if (l is NoConnectionFailure) {
        Get.snackbar("No connection", "Please check your internet connection");
      }
    }, (r) {
      incomes = r;

      //generate two lists per id in income with relation
      for (final income in incomes) {
        //generate the vendor list compared to income
        for (final vendor in vendors) {
          if (income.vendor == vendor.id) {
            generatedVendors.add(vendor);
            break;
          }
        }

        //generate the paymentType list compared to income
        for (final paymentType in paymentTypes) {
          if (income.type == paymentType.id) {
            generatedPaymentTypes.add(paymentType);
            break;
          }
        }
      }
    });

    isLoading.value = false;
  }

  Future<void> addIncome() async {
    isAddingIncome.value = true;

    final result = await repository.addIncome(vendor: vendorController.text, date: dateController.text, amount: amountController.text);

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
