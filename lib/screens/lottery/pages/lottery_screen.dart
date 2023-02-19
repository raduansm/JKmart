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
                    // GlobalBottomButton(
                    //   text: "1 September 2021",
                    //   onPressed: () {},
                    //   isSolidButton: true,
                    //   color: CustomColor.secondaryColor,
                    // ),
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
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Text(
                    //       "Serial ",
                    //       style: Get.textTheme.headline5,
                    //     ),
                    //     Text(
                    //       "Start ",
                    //       style: Get.textTheme.headline5,
                    //     ),
                    //     Text(
                    //       "Close ",
                    //       style: Get.textTheme.headline5,
                    //     ),
                    //     Text(
                    //       "Total",
                    //       style: Get.textTheme.headline5,
                    //     ),
                    //   ],
                    // ),
                    const SizedBox(
                      height: 5,
                    ),
                    // const Divider(
                    //   color: Colors.white,
                    //   thickness: 1,
                    // ),
                    ListView.separated(
                      shrinkWrap: true,
                      reverse: false,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: CustomColor.secondaryColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Serial: ${controller.lotteries[index].serial}",
                                    style: Get.textTheme.headline5,
                                  ),
                                  Text(
                                    "\$${controller.lotteryPrices[index]}",
                                    style: Get.textTheme.headline5,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Start at : ${controller.lotteries[index].start}",
                                        style: Get.textTheme.headline6,
                                      ),
                                      Text(
                                        "Close at : ${controller.lotteries[index].close}",
                                        style: Get.textTheme.headline6,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "Sold : ${controller.lotteries[index].total}",
                                        style: Get.textTheme.headline6,
                                      ),
                                      Text(
                                        "Income : \$${int.parse(controller.lotteries[index].total ?? "0") * controller.lotteryPrices[index]}",
                                        style: Get.textTheme.headline6,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                        // return Column(
                        //   children: [
                        //     // if (index == 0 || controller.lotteries[index].date != controller.lotteries[index - 1].date)
                        //     //   Container(
                        //     //     height: 40,
                        //     //     width: double.infinity,
                        //     //     alignment: Alignment.center,
                        //     //     color: CustomColor.secondaryColor.withOpacity(0.3),
                        //     //     margin: const EdgeInsets.symmetric(vertical: 8),
                        //     //     child: Text(
                        //     //       DateFormat("dd MMMM yyyy").format(DateTime.parse(controller.lotteries[index].date!)),
                        //     //       textAlign: TextAlign.center,
                        //     //       style: Get.textTheme.subtitle2,
                        //     //     ),
                        //     //   ),
                        //     Container(
                        //       padding: const EdgeInsets.symmetric(horizontal: 10),
                        //       height: 25,
                        //       color: CustomColor.secondaryColor,
                        //       child: Row(
                        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //         children: [
                        //           SizedBox(
                        //             width: 20,
                        //             child: Text(
                        //               controller.lotteries[index].serial!,
                        //               style: Get.textTheme.subtitle1,
                        //               textAlign: TextAlign.center,
                        //             ),
                        //           ),
                        //           SizedBox(
                        //             width: 20,
                        //             child: Text(
                        //               controller.lotteries[index].start!,
                        //               style: Get.textTheme.subtitle1,
                        //               textAlign: TextAlign.center,
                        //             ),
                        //           ),
                        //           SizedBox(
                        //             width: 20,
                        //             child: Text(
                        //               controller.lotteries[index].close!,
                        //               style: Get.textTheme.subtitle1,
                        //               textAlign: TextAlign.center,
                        //             ),
                        //           ),
                        //           SizedBox(
                        //             width: 20,
                        //             child: Text(
                        //               controller.lotteries[index].total!,
                        //               style: Get.textTheme.subtitle1,
                        //               textAlign: TextAlign.center,
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //     if (index == controller.lotteries.length - 1)
                        //       Container(
                        //         margin: const EdgeInsets.only(top: 10),
                        //         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        //         color: CustomColor.secondaryColor,
                        //         child: Row(children: [
                        //           Text(
                        //             "Total:",
                        //             style: Get.textTheme.headline5,
                        //           ),
                        //           const Spacer(),
                        //           Text(
                        //             controller.totalSold.toString(),
                        //             style: Get.textTheme.headline5,
                        //           )
                        //         ]),
                        //       )
                        //   ],
                        // );
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
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
