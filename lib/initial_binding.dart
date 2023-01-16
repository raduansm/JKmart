import 'package:get/get.dart';
import 'package:jkmart/controllers/auth_controller.dart';
import 'package:jkmart/controllers/expense_controller.dart';
import 'package:jkmart/controllers/home_controller.dart';
import 'package:jkmart/controllers/income_controller.dart';
import 'package:jkmart/controllers/lottery_controller.dart';
import 'package:jkmart/data/repositories/expense_repository.dart';
import 'package:jkmart/data/repositories/income_repository.dart';
import 'package:jkmart/data/repositories/lottery_repository.dart';
import 'package:jkmart/injection_container.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LotteryController>(() => LotteryController(repository: sl<LotteryRepository>()));
    Get.lazyPut<IncomeController>(() => IncomeController(repository: sl<IncomeRepository>()));
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<ExpenseController>(() => ExpenseController(repository: sl<ExpenseRepository>()));
  }
}
