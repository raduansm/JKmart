import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jkmart/controllers/income_controller.dart';
import 'package:jkmart/core/utils/colors.dart';
import 'package:jkmart/core/widgets/global_bottom_button.dart';
import 'package:jkmart/screens/home/widgets/appdrawer.dart';
import 'package:jkmart/screens/income/widgets/add_incomes.dart';

class IncomeScreen extends GetView<IncomeController> {
  const IncomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryColor,
      // key: controller.scaffoldKey,
      drawer: const AppDrawer(),
      body: Obx(
        () => SafeArea(
          child: controller.isLoading.value
              ? const Center(
                  child: CupertinoActivityIndicator(),
                )
              : ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: [
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => Get.back(),
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: CustomColor.secondaryColor,
                              child: Image.asset('assets/images/menu.png',
                                  scale: 5),
                            ),
                          ),
                          const Text(
                            'Income',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const AddIncome(),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 40,
                        child: Row(
                          children: [
                            Expanded(
                              child: GlobalBottomButton(
                                text: "Name",
                                onPressed: () {},
                                isSolidButton: true,
                                color: CustomColor.secondaryColor,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: GlobalBottomButton(
                                text: "Amount",
                                onPressed: () {},
                                isSolidButton: true,
                                color: CustomColor.secondaryColor,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: GlobalBottomButton(
                                text: "Date",
                                onPressed: () {},
                                isSolidButton: true,
                                color: CustomColor.secondaryColor,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                            height: 40,
                            color: CustomColor.secondaryColor,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    child: Text(
                                        controller.incomes[index].vendor!,
                                        style: Get.textTheme.bodyText1!
                                            .copyWith(color: Colors.white)),
                                  ),
                                  const SizedBox(width: 1),
                                  // const Padding(
                                  //   padding:
                                  //       EdgeInsets.only(top: 10, bottom: 10),
                                  //   child: VerticalDivider(
                                  //     color: Colors.white,
                                  //     thickness: 1,
                                  //   ),
                                  // ),
                                  Expanded(
                                    child: Text(
                                        controller.incomes[index].amount!,
                                        style: Get.textTheme.bodyText1!
                                            .copyWith(color: Colors.white)),
                                  ),
                                  // const Padding(
                                  //   padding:
                                  //       EdgeInsets.only(top: 10, bottom: 10),
                                  //   child: VerticalDivider(
                                  //     color: Colors.white,
                                  //     thickness: 1,
                                  //   ),
                                  // ),
                                  Expanded(
                                    child: Text(controller.incomes[index].date!,
                                        style: Get.textTheme.bodyText1!
                                            .copyWith(color: Colors.white)),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 5);
                        },
                        itemCount: controller.incomes.length,
                      ),
                    ]),
        ),
      ),
    );
  }
}
