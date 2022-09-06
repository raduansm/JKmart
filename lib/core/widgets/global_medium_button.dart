import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GlobalMediumButton extends StatelessWidget {
  const GlobalMediumButton({
    Key? key,
    required this.onPressed,
    this.height = 40,
    this.width = 116,
    this.color = Colors.white,
    required this.icon,
    required this.title,
    this.borderRaius = 15,
  }) : super(key: key);

  final VoidCallback onPressed;
  final double height;
  final double width;
  final Color color;
  final Widget icon;
  final String title;
  final double borderRaius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRaius),
          color: color,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(width: 10),
            Text(
              title,
              style: Get.textTheme.subtitle2,
            ),
          ],
        ),
      ),
    );
  }
}
