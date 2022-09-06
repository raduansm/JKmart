import 'package:get/get.dart';
import 'package:jkmart/controllers/auth_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => HomeController());
    Get.lazyPut(() => AuthController());
  }
}
