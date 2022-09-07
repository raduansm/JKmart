import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  DrawerTile({
    Key? key,
    // required this.imagePath,
    required this.textData,
    required this.onTap,
    required this.width,
  }) : super(key: key);

  // final String imagePath;
  final String textData;
  final GestureTapCallback onTap;
  double width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        height: 40,
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
              style: const TextStyle(
                color: Color.fromARGB(255, 55, 204, 220),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
