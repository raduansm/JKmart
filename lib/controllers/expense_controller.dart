import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jkmart/core/error/failures.dart';
import 'package:jkmart/data/models/expense_model.dart';
import 'package:jkmart/data/models/expense_type_model.dart';
import 'package:jkmart/data/models/payment_type_model.dart';
import 'package:jkmart/data/models/vendor_model.dart';
import 'package:jkmart/data/repositories/expense_repository.dart';

class ExpenseController extends GetxController {
  final ExpenseRepository repository;

  ExpenseController({required this.repository});
  final String collectionId = "634f40a9c1be74eb6ae6";
  final String databaseId = "62dc4ad195fe6c0fe8c5";

  ///List of all expenses from server

  List<ExpenseModel> expenses = [];
  List<VendorModel> vendors = [];
  List<ExpenseTypeModel> expenseTypes = [];

  //These variables are generated list for showing in UI
  List<VendorModel> generatedVendors = [];
  List<ExpenseTypeModel> generatedExpenseTypes = [];

  ///This veriable shows if api is getting data
  RxBool isLoading = false.obs;

  ///This variable represents the selected Vendor of income adding scree
  RxInt selectedVendorIndex = 0.obs;

  ///This variable represents the selected PaymentType of income adding scree
  RxInt selectedExpenseType = 0.obs;

  ///This veriable shows if api is creating a new expense data
  RxBool isAddingExpense = false.obs;

  ///add expense amount text controller
  TextEditingController amountController = TextEditingController();

  ///add income payment Details text controller
  TextEditingController expenseDetailsController = TextEditingController();

  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  Rx<DateTime> selectedDate = DateTime.now().obs;

  final formKey = GlobalKey<FormState>();
  //====== expense filter properties Start======
  RxnInt vendorFilterValue = RxnInt();
  RxnInt expenseTypeFilterValue = RxnInt();
  TextEditingController amountFilterController = TextEditingController();
  Rxn<DateTime> filterDate = Rxn<DateTime>();
  //====== expense filter properties End======

  @override
  void onInit() {
    super.onInit();

    getExpenses();
  }

  void resetAddIncomeFields() {
    selectedVendorIndex.value = 0;
    selectedExpenseType.value = 0;
    amountController.clear();
    selectedDate.value = DateTime.now();
  }

  void updateDate(DateTime date) {
    selectedDate.value = date;
    update();
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
    final result = await repository.getExpenseTypes();

    result.fold((l) {
      if (l is NoConnectionFailure) {
        Get.snackbar("No connection", "Please check your internet connection");
      }
    }, (r) {
      expenseTypes = r;
    });
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

  String? addExpenseFieldsValidator(value) {
    if (value!.isEmpty) {
      return "This field is required";
    } else if (int.tryParse(value) == null) {
      return "Please enter number only. Example: 27";
    } else {
      return null;
    }
  }

  // Future<void> getExpenses() async {
  //   isLoading.value = true;

  //   final result = await repository.getExpenses();

  //   result.fold((l) {
  //     if (l is NoConnectionFailure) {
  //       Get.snackbar("No connection", "Please check your internet connection");
  //     } else {
  //       Get.snackbar("Something went wrong", "Please try again later");
  //     }
  //   }, (r) {
  //     expenses = r;
  //   });

  //   isLoading.value = false;
  // }

  Future<void> getExpenses() async {
    isLoading.value = true;

    if (vendorFilterValue.value == null && filterDate.value == null && expenseTypeFilterValue.value == null) {
      await getVendors();
      await getPaymentTypes();
    }

    final result = await repository.getExpenses(
      vendorQuery: vendorFilterValue.value != null ? vendors[vendorFilterValue.value!].id : null,
      dateQuery: filterDate.value != null ? DateUtils.dateOnly(filterDate.value!).toIso8601String() : null,
      expenseTypeQuery: expenseTypeFilterValue.value != null ? expenseTypes[expenseTypeFilterValue.value!].id : null,
    );

    result.fold((l) {
      if (l is NoConnectionFailure) {
        Get.snackbar("No connection", "Please check your internet connection");
      }
    }, (r) {
      expenses = r;
      generatedVendors.clear();
      generatedExpenseTypes.clear();

      //generate two lists per id in income with relation
      for (final expense in expenses) {
        //generate the vendor list compared to income
        for (final vendor in vendors) {
          if (expense.vendor == vendor.id) {
            generatedVendors.add(vendor);
            break;
          }
        }

        //generate the paymentType list compared to income
        for (final expenseType in expenseTypes) {
          if (expense.type == expenseType.id) {
            generatedExpenseTypes.add(expenseType);
            break;
          }
        }
      }
    });

    isLoading.value = false;
  }

  Future<void> addExpense() async {
    if (!formKey.currentState!.validate()) return;

    isAddingExpense.value = true;

    final result = await repository.addExpense(vendor: vendors[selectedVendorIndex.value].id!, date: DateUtils.dateOnly(selectedDate.value).toIso8601String(), amount: amountController.text, expenseDetails: expenseDetailsController.text, type: expenseTypes[selectedExpenseType.value].id!);

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
