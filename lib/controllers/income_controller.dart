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
  RxBool isShowSearchButtons = false.obs;

  ///add income amount text controller
  TextEditingController amountController = TextEditingController();

  ///add income payment Details text controller
  TextEditingController paymentDetailsController = TextEditingController();

  ///add income selectedDate controller
  Rx<DateTime> selectedDate = DateTime.now().obs;

  ///This variable represents the selected Vendor of income adding scree
  RxInt selectedVendorIndex = 0.obs;

  ///This variable represents the selected PaymentType of income adding scree
  RxInt selectedPaymentType = 0.obs;

  ///Form key to validate all the fields of add lottery
  final formKey = GlobalKey<FormState>();

  //====== income filter properties Start======
  RxnInt vendorFilterValue = RxnInt();
  RxnInt paymentTypeFilterValue = RxnInt();
  TextEditingController amountFilterController = TextEditingController();
  Rxn<DateTime> filterDate = Rxn<DateTime>();
  //====== income filter properties End======

  @override
  void onInit() {
    super.onInit();

    getIncomes();
  }

  void resetAddIncomeFields() {
    selectedVendorIndex.value = 0;
    selectedPaymentType.value = 0;
    amountController.clear();
    selectedDate.value = DateTime.now();
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

    if (vendorFilterValue.value == null && filterDate.value == null && paymentTypeFilterValue.value == null) {
      await getVendors();
      await getPaymentTypes();
    }

    final result = await repository.getIncomes(
      vendorQuery: vendorFilterValue.value != null ? vendors[vendorFilterValue.value!].id : null,
      dateQuery: filterDate.value != null ? DateUtils.dateOnly(filterDate.value!).toIso8601String() : null,
      paymentTypeQuery: paymentTypeFilterValue.value != null ? paymentTypes[paymentTypeFilterValue.value!].id : null,
    );

    result.fold((l) {
      if (l is NoConnectionFailure) {
        Get.snackbar("No connection", "Please check your internet connection");
      }
    }, (r) {
      incomes = r;
      generatedVendors.clear();
      generatedPaymentTypes.clear();

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
    if (!formKey.currentState!.validate()) return;

    isAddingIncome.value = true;

    final result = await repository.addIncome(vendor: vendors[selectedVendorIndex.value].id!, date: DateUtils.dateOnly(selectedDate.value).toIso8601String(), amount: amountController.text, paymentDetails: paymentDetailsController.text, type: paymentTypes[selectedPaymentType.value].id!);

    result.fold((l) {
      Get.back();
      if (l is NoConnectionFailure) {
        Get.snackbar("No connection", "Please check your internet connection");
      } else {
        Get.snackbar("Something went wrong", "Please try again later");
      }
    }, (r) {
      getIncomes();
      resetAddIncomeFields();
      Get.back();
      Get.snackbar("Income added", 'New income added successfully');
    });

    isAddingIncome.value = false;
  }
}
