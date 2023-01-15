import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jkmart/core/error/failures.dart';
import 'package:jkmart/data/models/games_model.dart';
import 'package:jkmart/data/repositories/lottery_repository.dart';

import 'package:jkmart/data/models/lottery_model.dart';

class LotteryController extends GetxController {
  final LotteryRepository repository;

  LotteryController({required this.repository});

  ///List of all lotteries from server
  List<LotteryModel> lotteries = [];
  List<GamesModel> games = [];

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

  //Add lottery form game selection index
  RxInt selectedGameIndex = 0.obs;

  Rx<DateTime> queryDate = DateTime.now().obs;

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

    final result = await repository.getLotteries(queryDate: DateUtils.dateOnly(queryDate.value).compareTo(DateUtils.dateOnly(DateTime.now())) == 0 ? null : DateUtils.dateOnly(queryDate.value));

    result.fold((l) {
      if (l is NoConnectionFailure) {
        Get.snackbar("No connection", "Please check your internet connection");
      } else {
        Get.snackbar("Something went wrong", "Please try again later");
      }
    }, (r) {
      lotteries = r;
    });

    await getGames();
  }

  Future<void> getGames() async {
    final result = await repository.getGames();

    result.fold(
      (l) {
        if (l is NoConnectionFailure) {
          Get.snackbar("No connection", "Please check your internet connection");
        } else {
          Get.snackbar("Something went wrong", "Please try again later");
        }
      },
      (r) {
        games = r;
      },
    );

    isLoading.value = false;
  }

  Future<void> addLottery() async {
    if (!formKey.currentState!.validate()) return;
    if (games.isEmpty) {
      Get.snackbar("No Games Available", "You can not add any lottery now");
      return;
    }

    isAddingLottery.value = true;

    int start = int.parse(startController.text);
    int close = int.parse(closeController.text);

    for (final game in games) {
      if (game.gameId == games[selectedGameIndex.value].gameId) {
        start = start >= game.vloume! ? start - game.vloume! : start;
        close = close >= game.vloume! ? close - game.vloume! : close;
      }
    }

    final result = await repository.addLottery(
      serial: serialController.text,
      start: start.toString(),
      close: close.toString(),
      total: totalController.text,
      gameId: games[selectedGameIndex.value].gameId!,
      date: DateUtils.dateOnly(selectedDate.value),
    );

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
