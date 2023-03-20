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
    this.validator,
    this.readOnly = false,
    this.onChanged,
  }) : super(key: key);

  final TextEditingController? controller;
  final bool obscureText;
  final bool isPassword;
  final VoidCallback? onShowPasswordTap;
  final TextInputType? keyboardType;
  final TextAlign textAlign;
  final String? Function(String?)? validator;
  final bool readOnly;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 70,
      child: TextFormField(
        style: Get.textTheme.headline4,
        textAlign: textAlign,
        readOnly: readOnly,
        onChanged: onChanged,
        decoration: InputDecoration(
          errorMaxLines: 2,
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
        validator: validator,
      ),
    );
  }
}
