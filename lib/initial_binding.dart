import 'package:get/get.dart';
import 'package:jkmart/controllers/auth_controller.dart';
import 'package:jkmart/controllers/expense_controller.dart';
import 'package:jkmart/controllers/home_controller.dart';
import 'package:jkmart/controllers/lottery_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LotteryController>(() => LotteryController());
    Get.lazyPut(() => HomeController());

    Get.lazyPut(() => AuthController());

    Get.lazyPut(() => ExpenseController());
  }
}
