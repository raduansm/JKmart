import 'package:flutter/material.dart';
import 'package:jkmart/core/utils/colors.dart';
import 'package:jkmart/core/widgets/global_feature_card.dart';

class InventoryHomeBody extends StatelessWidget {
  const InventoryHomeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        const SizedBox(height: 30),
        GlobalFeatureCard(
          titleText: 'Search',
          detailsText: 'Press to search products and see details',
          imagePath: 'assets/images/search-normal.png',
          cardColor: CustomColor.green,
          onPressed: () {},
        ),
        const SizedBox(height: 20),
        GlobalFeatureCard(
          titleText: 'Add Products',
          detailsText: 'Press to add products in the inventory',
          imagePath: 'assets/images/shop-add.png',
          cardColor: CustomColor.purple,
          onPressed: () {},
        ),
        const SizedBox(height: 20),
        GlobalFeatureCard(
          titleText: 'Orders',
          detailsText: 'Press to see old orders or add a new order ',
          imagePath: 'assets/images/shopping-cart.png',
          cardColor: CustomColor.pastal,
          onPressed: () {},
        ),
      ],
    );
  }
}
