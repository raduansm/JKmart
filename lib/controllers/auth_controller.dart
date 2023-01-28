import 'package:appwrite/models.dart';
import 'package:dart_appwrite/models.dart' as awm;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jkmart/core/error/failures.dart';
import 'package:jkmart/data/repositories/auth_repository.dart';
import 'package:jkmart/initial_binding.dart';
import 'package:jkmart/screens/auth/sign_in_screen.dart';
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

  User? currentUser;

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

  ///when app is lunched and checking if user is logged in return `true`
  RxBool isAuthenticating = false.obs;

  ///when login api call is processing returns `true`
  RxBool isLoggingIn = false.obs;

  ///when adding new user is processing returns `true`
  RxBool isAddingUser = false.obs;

  ///when fetching all users from appwrite processing returns `true`
  RxBool isFetchingUsers = false.obs;

  List<awm.User> usersList = [];

  Color getRoleWiseColor({required String role}) {
    final int matchedIndex = userTypes.indexWhere((element) => element == role);

    switch (matchedIndex) {
      case 0:
        return Colors.red;
      case 1:
        return Colors.green;
      case 2:
        return Colors.yellow;
      default:
        return Colors.blue;
    }
  }

  Future<void> authenticateUser() async {
    isAuthenticating.value = true;

    currentUser = null;

    final result = await repository.authenticateUser();

    result.fold((l) {
      if (l is NoConnectionFailure) {
        Get.snackbar("No Internet", "Please check your internt connection");
      } else if (l is AuthenticationFailure) {
        //Do nothing. Stay on login page

      } else {
        Get.snackbar("Something went wrong", "Please try again later");
      }
    }, (r) {
      currentUser = r;
      Get.offAll(() => HomeScreen(), binding: InitialBinding());
    });

    isAuthenticating.value = false;
  }

  Future<void> logoutUser() async {
    final result = await repository.logoutUser();

    result.fold((l) {
      if (l is NoConnectionFailure) {
        Get.snackbar("No Internet", "Please check your internt connection");
      } else {
        Get.snackbar("Something went wrong", "Please try again later");
      }
    }, (r) {
      Get.offAll(() => const SignInScreen(), binding: InitialBinding());
    });
  }

  Future<void> loginUser() async {
    isLoggingIn.value = true;

    await Future.delayed(const Duration(seconds: 1));

    final result = await repository.loginUser(email: emailController.text, password: passwordController.text);

    result.fold((l) {
      if (l is NoConnectionFailure) {
        Get.snackbar("No Internet", "Please check your internt connection");
      } else if (l is LoginFailure) {
        Get.snackbar('Invalid Credentials', 'Please check the email and password');
      } else {
        Get.snackbar("Something went wrong", "Please try again later");
      }
    }, (r) {
      authenticateUser();
      // Get.offAll(() => const HomeScreen(), binding: InitialBinding());
    });

    isLoggingIn.value = false;
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
      getAllUsers();
      Get.snackbar("User created", "New user created successfully");
    });

    // await Future.delayed(const Duration(seconds: 2));

    isAddingUser.value = false;
  }

  Future<void> getAllUsers() async {
    isFetchingUsers.value = true;

    final result = await repository.getUsers();

    result.fold((l) {}, (r) {
      usersList = r.users;
    });

    isFetchingUsers.value = false;
  }

  @override
  void onInit() {
    authenticateUser();
    super.onInit();
  }
}
