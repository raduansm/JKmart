import 'package:get/get.dart';

class AuthController extends GetxController {
  RxString selectedUserType = 'Inventory Manager'.obs;

  List<String> userTypes = [
    "Admin",
    "Cashier",
    "Inventory Manager",
  ];
}
