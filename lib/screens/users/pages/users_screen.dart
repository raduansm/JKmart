import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jkmart/core/utils/colors.dart';
import 'package:jkmart/core/widgets/global_appbar.dart';
import 'package:jkmart/screens/users/widgets/add_user.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryColor,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: CustomColor.secondaryColor,
                    child: Image.asset('assets/images/menu.png', scale: 5),
                  ),
                ),
                Text(
                  'Users',
                  style: Get.textTheme.headline2,
                ),
                const AddUser(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
