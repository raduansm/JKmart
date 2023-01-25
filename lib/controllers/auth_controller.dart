import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jkmart/core/error/failures.dart';
import 'package:jkmart/data/repositories/auth_repository.dart';
import 'package:jkmart/initial_binding.dart';
import 'package:jkmart/screens/home/pages/home_screen.dart';

class AuthController extends GetxController {
  final AuthRepository repository;

  AuthController({required this.repository});

  RxString selectedUserType = 'Inventory Manager'.obs;

  List<String> userTypes = [
    "Admin",
    "Cashier",
    "Inventory Manager",
  ];

  //TextFields for signin scree
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //TextFields for adding new user
  TextEditingController regEmailController = TextEditingController();
  TextEditingController regPasswordController = TextEditingController();

  ///Form key to validate singin screen form
  final formKey = GlobalKey<FormState>();

  ///Form key to validate add user screen form
  final regFormKey = GlobalKey<FormState>();

  ///when login api call is processing returns `true`
  RxBool isLoading = false.obs;

  ///when adding new user is processing returns `true`
  RxBool isAddingUser = false.obs;

  Future<void> loginUser() async {
    isLoading.value = true;

    await Future.delayed(const Duration(seconds: 2));

    isLoading.value = false;

    Get.to(() => const HomeScreen(), binding: InitialBinding());
  }

  Future<void> addNewUser() async {
    if (!regFormKey.currentState!.validate()) return;
    isAddingUser.value = true;

    final result = await repository.createNewUser(email: regEmailController.text, password: regPasswordController.text, role: selectedUserType.value);

    result.fold((l) {
      if (l is NoConnectionFailure) {
        Get.snackbar("No Internet", "Please check your internt connection");
      } else {
        Get.snackbar("Something went wrong", "Please try again later");
      }
    }, (r) {
      Get.back();
      Get.snackbar("User created", "New user created successfully");
    });

    // await Future.delayed(const Duration(seconds: 2));

    isAddingUser.value = false;
  }
}
