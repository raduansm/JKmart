import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jkmart/controllers/auth_controller.dart';
import 'package:jkmart/core/utils/colors.dart';
import 'package:jkmart/core/widgets/global_bottom_button.dart';
import 'package:jkmart/core/widgets/global_text_field.dart';

class AddUser extends GetView<AuthController> {
  const AddUser({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: () => Get.focusScope!.unfocus(),
                child: AlertDialog(
                  scrollable: true,
                  backgroundColor: CustomColor.secondaryColor,
                  content: SizedBox(
                    height: 470,
                    width: Get.size.width,
                    child: Form(
                      key: controller.regFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerRight,
                            child: InkResponse(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: const CircleAvatar(
                                backgroundColor: Colors.red,
                                child: Icon(Icons.close),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "Email:",
                            style: Get.textTheme.headline4,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          GlobalTextField(
                            controller: controller.regEmailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter an email";
                              } else if (!value.isEmail) {
                                return "Please enter a valid email address";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 5),
                          const Divider(
                            color: Colors.white,
                            thickness: 1,
                          ),
                          Text(
                            "Password:",
                            style: Get.textTheme.headline4,
                          ),
                          const SizedBox(height: 5),
                          GlobalTextField(
                            controller: controller.regPasswordController,
                            keyboardType: TextInputType.visiblePassword,
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter a valid password";
                              } else if (value.length < 8) {
                                return "Password length can not be less than 8";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 5),
                          const Divider(
                            color: Colors.white,
                            thickness: 1,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "Role:",
                            style: Get.textTheme.headline4,
                          ),
                          const SizedBox(height: 5),
                          GestureDetector(
                            onTap: () {
                              Get.bottomSheet(Container(
                                  color: CustomColor.primaryColor,
                                  child: ListView.separated(
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            controller.selectedUserType.value = controller.userTypes[index];
                                            Get.back();
                                          },
                                          child: ListTile(
                                            title: Text(
                                              controller.userTypes[index],
                                              textAlign: TextAlign.center,
                                              style: Get.textTheme.headline4,
                                            ),
                                          ),
                                        );
                                      },
                                      separatorBuilder: (context, index) {
                                        return const Divider(
                                          color: Colors.white,
                                        );
                                      },
                                      itemCount: controller.userTypes.length)));
                            },
                            child: Obx(
                              () => Container(
                                alignment: Alignment.center,
                                height: 45,
                                decoration: BoxDecoration(
                                  color: CustomColor.grey3,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  controller.selectedUserType.value,
                                  style: Get.textTheme.headline4,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Obx(
                            () => Visibility(
                              visible: !controller.isAddingUser.value,
                              replacement: const Center(
                                  child: CircularProgressIndicator(
                                color: Colors.white,
                              )),
                              child: GlobalBottomButton(
                                text: "ADD",
                                style: Get.textTheme.headline4,
                                onPressed: () {
                                  controller.addNewUser();
                                },
                                isSolidButton: true,
                                color: CustomColor.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            });
      },
      child: const CircleAvatar(
        radius: 20,
        backgroundColor: CustomColor.secondaryColor,
        child: Icon(
          Icons.add,
          size: 20,
          color: Colors.white60,
        ),
      ),
    );
  }
}
