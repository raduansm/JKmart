import 'package:get/get.dart';
import 'package:jkmart/core/error/failures.dart';
import 'package:jkmart/data/repositories/income_repository.dart';
import 'package:jkmart/data/repositories/lottery_repository.dart';
import 'package:jkmart/screens/income/model/income_model.dart';

class IncomeController extends GetxController {
  final IncomeRepository repository;

  IncomeController({required this.repository});

  List<IncomeModel> incomes = [];
  RxBool isLoading = false.obs;

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
}
