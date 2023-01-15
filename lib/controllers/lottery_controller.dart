import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jkmart/core/error/failures.dart';
import 'package:jkmart/data/repositories/lottery_repository.dart';

import 'package:jkmart/data/models/lottery_model.dart';

class LotteryController extends GetxController {
  final LotteryRepository repository;

  LotteryController({required this.repository});

  ///List of all lotteries from server
  List<LotteryModel> lotteries = [];

  ///This veriable shows if api is getting data
  RxBool isLoading = false.obs;

  ///This veriable shows if api is creating a new lottery data
  RxBool isAddingLottery = false.obs;

  //text fields for adding lottery
  TextEditingController serialController = TextEditingController();
  TextEditingController startController = TextEditingController();
  TextEditingController closeController = TextEditingController();
  TextEditingController totalController = TextEditingController();
  Rx<DateTime> selectedDate = DateTime.now().obs;

  ///Form key to validate all the fields of add lottery
  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();

    getLotteries();
  }

  void updateDate(DateTime date) {
    selectedDate.value = date;
    update();
  }

  String? addLotteryFieldsValidator(value) {
    if (value!.isEmpty) {
      return "This field is required";
    } else if (int.tryParse(value) == null) {
      return "Please enter number only. Example: 27";
    } else {
      return null;
    }
  }

  Future<void> getLotteries() async {
    isLoading.value = true;

    final result = await repository.getLotteries();

    result.fold((l) {
      if (l is NoConnectionFailure) {
        Get.snackbar("No connection", "Please check your internet connection");
      } else {
        Get.snackbar("Something went wrong", "Please try again later");
      }
    }, (r) {
      lotteries = r;
    });

    isLoading.value = false;
  }

  Future<void> addLottery() async {
    if (!formKey.currentState!.validate()) return;

    isAddingLottery.value = true;

    final result = await repository.addLottery(serial: serialController.text, start: startController.text, close: closeController.text, total: totalController.text);

    result.fold((l) {
      Get.back();
      if (l is NoConnectionFailure) {
        Get.snackbar("No connection", "Please check your internet connection");
      } else {
        Get.snackbar("Something went wrong", "Please try again later");
      }
    }, (r) {
      getLotteries();
      Get.back();
      Get.snackbar("Lottery added", 'New lottery added successfully');
    });

    isAddingLottery.value = false;
  }
}
