import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jkmart/controllers/auth_controller.dart';
import 'package:jkmart/core/utils/colors.dart';
import 'package:jkmart/core/widgets/global_bottom_button.dart';
import 'package:jkmart/core/widgets/global_text_field.dart';
import 'package:jkmart/initial_binding.dart';
import 'package:jkmart/screens/home/pages/home_screen.dart';
import 'package:lottie/lottie.dart';

class SignInScreen extends GetView<AuthController> {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.focusScope?.unfocus(),
      child: Scaffold(
        backgroundColor: CustomColor.primaryColor,
        body: Obx(
          () => controller.isAuthenticating.value
              ? Center(child: Lottie.asset('assets/animations/splash_loading.json'))
              : ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    const SizedBox(height: 150),
                    // Lottie.asset('assets/animations/otp.json', height: 100),
                    Hero(
                      tag: 'authLogo',
                      child: Container(
                        height: 130,
                        width: 130,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: CustomColor.grey,
                        ),
                        child: Lottie.asset(
                          'assets/animations/otp.json',
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(text: 'Please '),
                          TextSpan(text: 'sign in ', style: Get.textTheme.headline5?.copyWith(color: CustomColor.blue)),
                          const TextSpan(text: 'first to continue '),
                        ],
                      ),
                      textAlign: TextAlign.center,
                      style: Get.textTheme.headline5,
                    ),
                    // const SizedBox(height: 20),
                    // GestureDetector(
                    //   onTap: () {
                    //     Get.bottomSheet(Container(
                    //         color: CustomColor.primaryColor,
                    //         child: ListView.separated(
                    //             itemBuilder: (context, index) {
                    //               return GestureDetector(
                    //                 onTap: () {
                    //                   controller.selectedUserType.value = controller.userTypes[index];
                    //                   Get.back();
                    //                 },
                    //                 child: ListTile(
                    //                   title: Text(
                    //                     controller.userTypes[index],
                    //                     style: Get.textTheme.headline4,
                    //                   ),
                    //                 ),
                    //               );
                    //             },
                    //             separatorBuilder: (context, index) {
                    //               return const Divider(
                    //                 color: Colors.white,
                    //               );
                    //             },
                    //             itemCount: controller.userTypes.length)));
                    //   },
                    //   child: Container(
                    //     alignment: Alignment.center,
                    //     height: 45,
                    //     decoration: BoxDecoration(
                    //       color: CustomColor.grey3,
                    //       borderRadius: BorderRadius.circular(20),
                    //     ),
                    //     child: Text(
                    //       controller.selectedUserType.value,
                    //       style: Get.textTheme.headline4,
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(height: 40),
                    Form(
                      key: controller.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Email',
                            style: Get.textTheme.headline5,
                          ),
                          const SizedBox(height: 20),
                          GlobalTextField(
                            controller: controller.emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter an email";
                              } else if (!value.isEmail) {
                                return "Please enter a valid email address";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Password',
                            style: Get.textTheme.headline5,
                          ),
                          const SizedBox(height: 20),
                          GlobalTextField(
                            controller: controller.passwordController,
                            obscureText: true,
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter a valid password";
                              } else if (value.length < 8) {
                                return "Password length can not be less than 8";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        final Uri phoneUri = Uri.parse(
                          'https://safihealth.org/password/reset',
                        );

                        // launchUrl(
                        //   phoneUri,
                        //   mode: LaunchMode.inAppWebView,
                        // );
                      },
                      child: Text(
                        'Forgot password?',
                        textAlign: TextAlign.center,
                        style: Get.textTheme.headline6?.copyWith(color: CustomColor.blue),
                      ),
                    ),
                    const SizedBox(height: 20),
                    UnconstrainedBox(
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        height: 55,
                        width: controller.isLoggingIn.value ? 80 : Get.size.width - 40,
                        decoration: BoxDecoration(
                          color: CustomColor.pink,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: controller.isLoggingIn.value
                            ? const UnconstrainedBox(child: SizedBox(height: 30, width: 30, child: CircularProgressIndicator(color: Colors.white)))
                            : GlobalBottomButton(
                                onPressed: () {
                                  if (!controller.formKey.currentState!.validate()) return;
                                  // controller.signIn();
                                  controller.loginUser();
                                },
                                text: 'Sign in',
                                isSolidButton: true,
                              ),
                      ),
                    ),

                    const SizedBox(height: 20),
                    // Text(
                    //   'Don’t have an account yet?',
                    //   textAlign: TextAlign.center,
                    //   style: GoogleFonts.mulish(
                    //     fontSize: 16,
                    //   ),
                    // ),
                    // const SizedBox(height: 20),
                    // GlobalBottomButton(
                    //   text: 'Register yourself',
                    //   onPressed: () {
                    //     // Get.to(const SignUpScreen(), binding: InitialBinding());
                    //   },
                    //   isSolidButton: false,
                    // ),
                    const SizedBox(height: 30),
                  ],
                ),
        ),
      ),
    );
  }
}
