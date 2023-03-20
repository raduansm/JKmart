import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jkmart/controllers/lottery_controller.dart';
import 'package:jkmart/core/utils/colors.dart';
import 'package:jkmart/core/widgets/global_bottom_button.dart';
import 'package:jkmart/core/widgets/global_cupertino_datepicker.dart';
import 'package:jkmart/core/widgets/global_text_field.dart';
import 'package:jkmart/data/models/lottery_model.dart';

class LotteryCard extends StatelessWidget {
  const LotteryCard({
    super.key,
    required this.controller,
    required this.index,
  });

  final LotteryController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final TextEditingController serialController = TextEditingController(text: controller.lotteries[index].serial);
        final TextEditingController startController = TextEditingController(text: controller.lotteries[index].start);
        final TextEditingController closeController = TextEditingController(text: controller.lotteries[index].close);
        final TextEditingController totalController = TextEditingController(text: controller.lotteries[index].total);
        final GlobalKey<FormState> updateKey = GlobalKey<FormState>();
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: () => Get.focusScope!.unfocus(),
                child: AlertDialog(
                  scrollable: true,
                  backgroundColor: CustomColor.secondaryColor,
                  content: Form(
                    key: updateKey,
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerRight,
                          child: InkResponse(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: const CircleAvatar(
                              backgroundColor: Colors.red,
                              child: Icon(Icons.close),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          // height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 50,
                                child: Text(
                                  "Game:",
                                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: Container(
                                  // height: 45,
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 3),
                                  decoration: BoxDecoration(
                                    color: CustomColor.grey3,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    // "Bear Grylls is a man of steel",
                                    "${controller.lotteries[index].gameId ?? ""}",
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.visible,
                                    style: Get.textTheme.headline4,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          color: Colors.white,
                          thickness: 1,
                        ),
                        SizedBox(
                          // height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 50,
                                child: Text(
                                  "Serial:",
                                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: GlobalTextField(
                                  validator: controller.addLotteryFieldsValidator,
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  controller: serialController,
                                  readOnly: true,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          color: Colors.white,
                          thickness: 1,
                        ),
                        SizedBox(
                          // height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 50,
                                child: Text(
                                  "Start:",
                                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Flexible(
                                child: GlobalTextField(
                                  validator: controller.addLotteryFieldsValidator,
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  controller: startController,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          color: Colors.white,
                          thickness: 1,
                        ),
                        SizedBox(
                          // height: 100,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 50,
                                child: Text(
                                  "Close:",
                                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Flexible(
                                child: GlobalTextField(
                                  validator: controller.addLotteryFieldsValidator,
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  controller: closeController,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          color: Colors.white,
                          thickness: 1,
                        ),
                        SizedBox(
                          // height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 50,
                                child: Text(
                                  "Total:",
                                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: GlobalTextField(
                                  validator: controller.addLotteryFieldsValidator,
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  controller: totalController,
                                ),
                              )
                            ],
                          ),
                        ),
                        const Divider(
                          color: Colors.white,
                          thickness: 1,
                        ),
                        SizedBox(
                          // height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 50,
                                child: Text(
                                  "Date:",
                                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: GlobalCupertinoDatePicker(
                                  readOnly: true,
                                  onDateChanged: (DateTime date) {
                                    controller.updateDate(date);
                                  },
                                  initialDateTime: DateTime.parse(controller.lotteries[index].date!),
                                  label: DateFormat("dd-MMM-yy").format(DateTime.parse(controller.lotteries[index].date!)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Obx(
                          () => Visibility(
                            visible: !controller.isUpdatingLottery.value,
                            replacement: const Center(
                                child: CircularProgressIndicator(
                              color: Colors.white,
                            )),
                            child: GlobalBottomButton(
                              text: "UPDATE",
                              onPressed: () {
                                if (!updateKey.currentState!.validate()) return;
                                // controller.addLottery();

                                controller.updateLottery(
                                  id: controller.lotteries[index].id!,
                                  serial: controller.lotteries[index].serial!,
                                  start: startController.text,
                                  close: closeController.text,
                                  total: totalController.text,
                                  gameId: controller.lotteries[index].gameId!,
                                  date: DateTime.parse(controller.lotteries[index].date!),
                                );
                              },
                              isSolidButton: true,
                              color: CustomColor.primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            });
      },
      child: Container(
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
      ),
    );
  }
}
