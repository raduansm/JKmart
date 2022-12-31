import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jkmart/controllers/auth_controller.dart';
import 'package:jkmart/core/utils/colors.dart';
import 'package:jkmart/core/widgets/global_bottom_button.dart';
import 'package:jkmart/core/widgets/global_text_field.dart';
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
          () => ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              const SizedBox(height: 80),
              Lottie.asset('assets/animations/otp.json', height: 100),
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
              const SizedBox(height: 20),
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
                child: Container(
                  alignment: Alignment.center,
                  height: 45,
                  decoration: BoxDecoration(
                    color: CustomColor.grey3,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    controller.selectedUserType.value,
                    style: Get.textTheme.headline4,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Text(
                'Email',
                style: Get.textTheme.headline5,
              ),
              const SizedBox(height: 20),
              const GlobalTextField(
                  // controller: controller.emailController,
                  ),
              const SizedBox(height: 20),
              Text(
                'Password',
                style: Get.textTheme.headline5,
              ),
              const SizedBox(height: 20),
              const GlobalTextField(
                // controller: controller.passwordController,
                obscureText: true,
              ),
              const SizedBox(height: 20),
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
              GlobalBottomButton(
                onPressed: () {
                  // controller.signIn();
                  Get.to(() => const HomeScreen());
                },
                text: 'Sign in',
                isSolidButton: true,
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
