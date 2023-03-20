import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jkmart/controllers/lottery_controller.dart';
import 'package:jkmart/core/utils/colors.dart';
import 'package:jkmart/core/widgets/global_bottom_button.dart';
import 'package:jkmart/core/widgets/global_cupertino_datepicker.dart';
import 'package:jkmart/core/widgets/global_text_field.dart';
import 'package:jkmart/screens/home/widgets/appdrawer.dart';
import 'package:jkmart/screens/lottery/widgets/add_lottery_widget.dart';
import 'package:jkmart/screens/lottery/widgets/lottery_card.dart';

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
                          child: const CircleAvatar(
                            radius: 20,
                            backgroundColor: CustomColor.secondaryColor,
                            child: Padding(
                              padding: EdgeInsets.only(right: 2),
                              child: Icon(
                                Icons.arrow_back_ios_new_rounded,
                                size: 20,
                                color: Colors.white60,
                              ),
                            ),
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
                    GlobalCupertinoDatePicker(
                      boxHeight: 55,
                      boxBackgroundColor: CustomColor.secondaryColor,
                      labelStyle: Get.textTheme.subtitle1,
                      label: DateFormat("dd MMMM yyyy").format(controller.queryDate.value),
                      initialDateTime: controller.queryDate.value,
                      onDateChanged: (value) {
                        controller.queryDate.value = value;
                      },
                      onComplete: (_) {
                        controller.getLotteries();
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        "Available Data",
                        style: Get.textTheme.headline4,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      reverse: false,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return LotteryCard(controller: controller, index: index);
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 8);
                      },
                      itemCount: controller.lotteries.length,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(
                        color: CustomColor.secondaryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Total",
                            style: Get.textTheme.headline4,
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Ticket sold",
                                style: Get.textTheme.headline5,
                              ),
                              Text(
                                controller.totalSold.toString(),
                                style: Get.textTheme.headline5,
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Ticket income",
                                style: Get.textTheme.headline5,
                              ),
                              Text(
                                "\$" + controller.totalSoldPrice.toString(),
                                style: Get.textTheme.headline5,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Obx(() => Visibility(
                          visible: !controller.isExportingData.value,
                          replacement: const Center(
                            child: CircularProgressIndicator(),
                          ),
                          child: GlobalBottomButton(
                            icon: const Padding(
                              padding: EdgeInsets.only(bottom: 3),
                              child: Icon(
                                CupertinoIcons.share,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                            text: "Export",
                            isSolidButton: true,
                            color: CustomColor.secondaryColor,
                            onPressed: () {
                              controller.exportToExcel();
                            },
                          ),
                        )),
                  ],
                ),
        ),
      ),
    );
  }
}
