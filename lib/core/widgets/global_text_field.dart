import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jkmart/core/utils/colors.dart';

class GlobalTextField extends StatelessWidget {
  const GlobalTextField({
    Key? key,
    this.controller,
    this.obscureText = false,
    this.isPassword = false,
    this.onShowPasswordTap,
    this.keyboardType,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  final TextEditingController? controller;
  final bool obscureText;
  final bool isPassword;
  final VoidCallback? onShowPasswordTap;
  final TextInputType? keyboardType;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        style: Get.textTheme.headline4,
        textAlign: textAlign,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.0),
          ),
          filled: true,
          fillColor: CustomColor.grey3,
          suffixIcon: isPassword
              ? GestureDetector(
                  onTap: onShowPasswordTap,
                  child: const Icon(Icons.remove_red_eye),
                )
              : null,
        ),
        controller: controller,
        obscureText: obscureText,
        autocorrect: !isPassword,
        enableSuggestions: !isPassword,
        keyboardType: keyboardType,
      ),
    );
  }
}
