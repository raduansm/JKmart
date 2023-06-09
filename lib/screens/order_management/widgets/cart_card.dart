import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jkmart/core/utils/colors.dart';

class CartCard extends StatelessWidget {
  final String title;
  final String title2;
  final String title3;
  final String title4;
  final String title5;
  final IconData icon;

  // final List<Widget> rowChildren;

  const CartCard({
    required this.title,
    required this.title2,
    required this.title3,
    required this.title4,
    required this.title5,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: CustomColor.secondaryColor,
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: CustomColor.white),
                ),
                Text(
                  title2,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: CustomColor.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Row(
                children: [
                  Icon(icon, color: CustomColor.white, size: 20),
                  const SizedBox(width: 10),
                  Text(
                    title3,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: CustomColor.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                        left: 8, right: 8, top: 3, bottom: 3),
                    decoration: BoxDecoration(
                      color: CustomColor.purple,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      title4,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: CustomColor.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  Container(
                    padding: const EdgeInsets.only(
                        left: 8, right: 8, top: 3, bottom: 3),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      title5,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: CustomColor.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              )
            ]),
          ],
        ),
      ),
    );
  }
}
