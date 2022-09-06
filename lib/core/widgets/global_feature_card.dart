import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GlobalFeatureCard extends StatelessWidget {
  const GlobalFeatureCard({
    Key? key,
    required this.titleText,
    required this.detailsText,
    required this.imagePath,
    required this.cardColor,
    required this.onPressed,
  }) : super(key: key);

  final String titleText;
  final String detailsText;
  final String imagePath;
  final Color cardColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 155,
        width: 335,
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      titleText,
                      style: Get.textTheme.headline2?.copyWith(color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      detailsText,
                      style: Get.textTheme.subtitle1?.copyWith(color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
            Image.asset(
              imagePath,
            ),
          ],
        ),
      ),
    );
  }
}
