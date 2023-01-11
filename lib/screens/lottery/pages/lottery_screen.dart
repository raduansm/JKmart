import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jkmart/controllers/lottery_controller.dart';
import 'package:jkmart/core/utils/colors.dart';
import 'package:jkmart/core/widgets/global_bottom_button.dart';
import 'package:jkmart/core/widgets/global_text_field.dart';
import 'package:jkmart/screens/home/widgets/appdrawer.dart';
import 'package:jkmart/screens/lottery/widgets/add_lottery_widget.dart';

class LotteryScreen extends GetView<LotteryController> {
  const LotteryScreen({Key? key}) : super(key: key);

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
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: CustomColor.secondaryColor,
                            child:
                                Image.asset('assets/images/menu.png', scale: 5),
                          ),
                        ),
                        const Text(
                          'Lottery',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const AddLottery(),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GlobalBottomButton(
                      text: "1 September 2021",
                      onPressed: () {},
                      isSolidButton: true,
                      color: CustomColor.secondaryColor,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Serial ",
                          style: Get.textTheme.headline5,
                        ),
                        Text(
                          "Start ",
                          style: Get.textTheme.headline5,
                        ),
                        Text(
                          "Close ",
                          style: Get.textTheme.headline5,
                        ),
                        Text(
                          "Total",
                          style: Get.textTheme.headline5,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 1,
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          height: 25,
                          color: CustomColor.secondaryColor,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 20,
                                child: Text(
                                  controller.lotteries[index].serial!,
                                  style: Get.textTheme.subtitle1,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                                child: Text(
                                  controller.lotteries[index].start!,
                                  style: Get.textTheme.subtitle1,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                                child: Text(
                                  controller.lotteries[index].close!,
                                  style: Get.textTheme.subtitle1,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                                child: Text(
                                  controller.lotteries[index].total!,
                                  style: Get.textTheme.subtitle1,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 5);
                      },
                      itemCount: controller.lotteries.length,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
