import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jkmart/controllers/lottery_controller.dart';
import 'package:jkmart/core/utils/colors.dart';
import 'package:jkmart/core/widgets/global_bottom_button.dart';
import 'package:jkmart/core/widgets/global_text_field.dart';
import 'package:jkmart/screens/home/widgets/appdrawer.dart';

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
                        GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    backgroundColor: CustomColor.secondaryColor,
                                    content: Stack(
                                      children: <Widget>[
                                        Positioned(
                                          right: -40.0,
                                          top: -40.0,
                                          child: InkResponse(
                                            onTap: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const CircleAvatar(
                                              child: Icon(Icons.close),
                                              backgroundColor: Colors.red,
                                            ),
                                          ),
                                        ),
                                        Form(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(
                                                height: 40,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: Row(
                                                  children: const [
                                                    Flexible(
                                                      child: Text(
                                                        "Date:",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 15,
                                                    ),
                                                    Flexible(
                                                        child:
                                                            GlobalTextField())
                                                  ],
                                                ),
                                              ),
                                              const Divider(
                                                color: Colors.white,
                                                thickness: 1,
                                              ),
                                              Container(
                                                height: 40,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: Row(
                                                  children: const [
                                                    Flexible(
                                                      child: Text(
                                                        "Start:",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 15,
                                                    ),
                                                    Flexible(
                                                        child:
                                                            GlobalTextField())
                                                  ],
                                                ),
                                              ),
                                              const Divider(
                                                color: Colors.white,
                                                thickness: 1,
                                              ),
                                              Container(
                                                height: 40,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: Row(
                                                  children: const [
                                                    Flexible(
                                                      child: Text(
                                                        "Close:",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 15,
                                                    ),
                                                    Flexible(
                                                        child:
                                                            GlobalTextField())
                                                  ],
                                                ),
                                              ),
                                              const Divider(
                                                color: Colors.white,
                                                thickness: 1,
                                              ),
                                              Container(
                                                height: 40,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: Row(
                                                  children: const [
                                                    Flexible(
                                                      child: Text(
                                                        "Total:",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 15,
                                                    ),
                                                    Flexible(
                                                        child:
                                                            GlobalTextField())
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              GlobalBottomButton(
                                                text: "ADD",
                                                onPressed: () {},
                                                isSolidButton: true,
                                                color: CustomColor.primaryColor,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          },
                          child: const CircleAvatar(
                            radius: 20,
                            backgroundColor: CustomColor.secondaryColor,
                            child: Icon(
                              Icons.add,
                              size: 20,
                              color: Colors.white60,
                            ),
                          ),
                        ),
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
                          "No. ",
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
