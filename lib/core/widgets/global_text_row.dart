import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GlobalTextRow extends StatelessWidget {
  const GlobalTextRow({
    Key? key,
    required this.firstText,
    required this.lastText,
    this.height = 15,
  }) : super(key: key);

  final String firstText;
  final String lastText;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: height),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              firstText,
              style: Get.textTheme.subtitle2,
            ),
            Text(
              lastText,
              style: Get.textTheme.headline6?.copyWith(fontSize: 18),
            ),
          ],
        ),
      ],
    );
  }
}
