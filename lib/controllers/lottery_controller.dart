import 'dart:io';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jkmart/core/error/failures.dart';
import 'package:jkmart/data/models/games_model.dart';
import 'package:jkmart/data/repositories/lottery_repository.dart';

import 'package:jkmart/data/models/lottery_model.dart';
import 'package:path_provider/path_provider.dart';

import 'package:path/path.dart';
import 'dart:io' as io;

import 'package:permission_handler/permission_handler.dart';

class LotteryController extends GetxController {
  final LotteryRepository repository;

  LotteryController({required this.repository});

  ///List of all lotteries from server
  List<LotteryModel> lotteries = [];
  List<GamesModel> games = [];
  List<int> lotteryPrices = [];

  ///This veriable shows if api is getting data
  RxBool isLoading = false.obs;

  ///This veriable shows if api is creating a new lottery data
  RxBool isAddingLottery = false.obs;
  RxBool isUpdatingLottery = false.obs;
  RxBool isExportingData = false.obs;

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

  int totalSold = 0;
  int totalSoldPrice = 0;

  @override
  void onInit() {
    super.onInit();

    getLotteries();
  }

  void clearTextFields() {
    serialController.clear();
    startController.clear();
    closeController.clear();
    totalController.clear();
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

    // final result = await repository.getLotteries(queryDate: DateUtils.dateOnly(queryDate.value).compareTo(DateUtils.dateOnly(DateTime.now())) == 0 ? null : DateUtils.dateOnly(queryDate.value));
    final result = await repository.getLotteries(queryDate: DateUtils.dateOnly(queryDate.value));

    result.fold((l) {
      if (l is NoConnectionFailure) {
        Get.snackbar("No connection", "Please check your internet connection");
      } else {
        Get.snackbar("Something went wrong", "Please try again later");
      }
    }, (r) {
      lotteries = r;
      totalSold = 0;
      for (var element in lotteries) {
        final elementsTotal = int.tryParse(element.total!);
        totalSold = totalSold + (elementsTotal ?? 0);
      }
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
        lotteryPrices.clear();
        totalSoldPrice = 0;
        for (final LotteryModel lottery in lotteries) {
          for (final GamesModel game in games) {
            if (lottery.gameId == game.gameId) {
              lotteryPrices.add(game.costOfTicket ?? 0);
              totalSoldPrice += (game.costOfTicket ?? 0) * (int.parse(lottery.total ?? "0"));
            }
          }
        }
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
      clearTextFields();
    });

    isAddingLottery.value = false;
  }

  Future<void> updateLottery({required String id, required String serial, required String start, required String close, required String total, required int gameId, required DateTime date}) async {
    isUpdatingLottery.value = true;

    final result = await repository.updateLottery(
      id: id,
      serial: serial,
      start: start,
      close: close,
      total: total,
      gameId: gameId,
      date: DateUtils.dateOnly(date),
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
      Get.snackbar("Lottery updated", 'Lottery updated successfully');
    });

    isUpdatingLottery.value = false;
  }

  static Future<Directory?> getDownloadDirectory() async {
    if (Platform.isIOS) return getApplicationDocumentsDirectory();

    final androidInfo = await DeviceInfoPlugin().androidInfo;

    bool isAndroidX = int.parse(androidInfo.version.release as String) > 10;

    if (!isAndroidX && !await Permission.storage.isGranted) {
      await Permission.storage.request();
    }

    if (!isAndroidX && (await Permission.storage.isDenied || await Permission.storage.isPermanentlyDenied)) {
      Fluttertoast.showToast(msg: "Storage permission is not given");
      return null;
    }

    String localPath = '/storage/emulated/0/Download';
    final savedDir = Directory(localPath);
    bool hasExisted = await savedDir.exists();
    if (!hasExisted) {
      savedDir.create();
    }

    return savedDir;
  }

  Future<void> exportToExcel() async {
    isExportingData.value = true;

    final excel = Excel.createExcel();
    final sheet = excel.sheets[excel.getDefaultSheet() as String];

    sheet!.cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 0)).value = "Price";

    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: 0)).value = "Open";

    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: 0)).value = "Close";

    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: 0)).value = "Sold";

    for (int j = 0; j < lotteries.length; j++) {
      for (int i = 0; i < 4; i++) {
        String value = "";
        if (i == 0) {
          value = "\$${lotteryPrices[j]}";
        } else if (i == 1) {
          value = lotteries[j].start ?? "";
        } else if (i == 2) {
          value = lotteries[j].close ?? "";
        } else if (i == 3) {
          value = lotteries[j].total ?? "";
        }

        sheet.cell(CellIndex.indexByColumnRow(columnIndex: i, rowIndex: j + 1)).value = value;
      }
    }

    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: lotteries.length + 3)).value = "Total Sold";
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: lotteries.length + 3)).value = totalSold.toString();

    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: lotteries.length + 4)).value = "Total Income";
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: lotteries.length + 4)).value = "\$$totalSoldPrice";

    var fileBytes = excel.save();
    var directory = await getDownloadDirectory();

    io.File(join("${directory!.path}/lottery_report_${DateFormat("dd-MMM-yy").format(queryDate.value)}.xlsx"))
      ..createSync(recursive: true)
      ..writeAsBytesSync(fileBytes!);

    Fluttertoast.showToast(msg: "File saved");

    isExportingData.value = false;
  }
}
