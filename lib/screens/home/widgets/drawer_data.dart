import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerTile extends StatelessWidget {
  const DrawerTile({
    Key? key,
    // required this.imagePath,
    required this.textData,
    required this.onTap,
    required this.width,
  }) : super(key: key);

  // final String imagePath;
  final String textData;
  final GestureTapCallback onTap;
  final double width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        height: 30,
        width: double.maxFinite,
        margin: const EdgeInsets.only(top: 30),
        child: Row(
          children: <Widget>[
            // Image.asset(
            //   imagePath,
            //   scale: 1,
            //   color: const Color.fromARGB(255, 95, 226, 150),
            // ),
            // SizedBox(
            //   width: width == null ? width = 20 : width,
            // ),
            Text(
              textData,
              style: Get.textTheme.subtitle1,
            ),
          ],
        ),
      ),
    );
  }
}
