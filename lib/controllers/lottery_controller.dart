import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:get/get.dart';
import 'package:jkmart/core/error/failures.dart';
import 'package:jkmart/data/repositories/lottery_repository.dart';

import 'package:jkmart/screens/lottery/model/lottery_model.dart';

class LotteryController extends GetxController {
  final LotteryRepository repository;

  LotteryController({required this.repository});

  List<LotteryModel> lotteries = [];
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();

    getLotteries();
  }

  Future<void> getLotteries() async {
    isLoading.value = true;

    final result = await repository.getLotteries();

    result.fold((l) {
      if (l is NoConnectionFailure) {
        Get.snackbar("No connection", "Please check your internet connection");
      }
    }, (r) {
      lotteries = r;
    });

    isLoading.value = false;
  }
}
