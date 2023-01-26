import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jkmart/controllers/auth_controller.dart';
import 'package:jkmart/core/utils/colors.dart';
import 'package:jkmart/core/widgets/global_appbar.dart';
import 'package:jkmart/screens/users/widgets/add_user.dart';

class UsersScreen extends GetView<AuthController> {
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
            const SizedBox(height: 30),
            Obx(
              () => controller.isFetchingUsers.value
                  ? const Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    )
                  : ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      reverse: true,
                      itemBuilder: (context, index) {
                        return Visibility(
                          visible: controller.usersList[index].name.isNotEmpty && controller.usersList[index].email.isNotEmpty,
                          child: Container(
                            height: 70,
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                              color: CustomColor.secondaryColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.usersList[index].name,
                                  style: Get.textTheme.headline5?.copyWith(color: controller.getRoleWiseColor(role: controller.usersList[index].name)),
                                ),
                                Text(
                                  controller.usersList[index].email,
                                  style: Get.textTheme.headline5,
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 10);
                      },
                      itemCount: controller.usersList.length,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
