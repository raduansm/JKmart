import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jkmart/controllers/expense_controller.dart';
import 'package:jkmart/controllers/lottery_controller.dart';
import 'package:jkmart/core/utils/colors.dart';
import 'package:jkmart/core/widgets/global_bottom_button.dart';
import 'package:jkmart/core/widgets/global_cupertino_datepicker.dart';
import 'package:jkmart/core/widgets/global_text_field.dart';

class AddExpense extends GetView<ExpenseController> {
  const AddExpense({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (controller.vendors.isEmpty) {
          Get.snackbar(
              "No Vendors Available", "You can not add any expense now");
          return;
        }

        if (controller.expenseTypes.isEmpty) {
          Get.snackbar(
              "No Expense Types Available", "You can not add any expense now");
          return;
        }

        showDialog(
            context: context,
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: () => Get.focusScope!.unfocus(),
                child: AlertDialog(
                  scrollable: true,
                  backgroundColor: CustomColor.secondaryColor,
                  content: SizedBox(
                    height: 600,
                    width: Get.size.width,
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                          Text(
                            "Vendor:",
                            style: Get.textTheme.headline4,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Obx(
                            () => Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  showCupertinoModalPopup(
                                    context: context,
                                    builder: (context) {
                                      return SizedBox(
                                        height: 250,
                                        child: CupertinoPicker.builder(
                                          childCount: controller.vendors.length,
                                          itemExtent: 25,
                                          backgroundColor: Colors.white,
                                          onSelectedItemChanged: (index) {
                                            controller.selectedVendorIndex
                                                .value = index;
                                          },
                                          itemBuilder: (context, index) {
                                            return Text(
                                              controller.vendors[index].name ??
                                                  "No name specified",
                                              textAlign: TextAlign.center,
                                              style: Get.textTheme.headline4
                                                  ?.copyWith(
                                                      color: Colors.black),
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  // height: 45,
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 3),
                                  decoration: BoxDecoration(
                                    color: CustomColor.grey3,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    // "Bear Grylls is a man of steel",
                                    controller
                                            .vendors[controller
                                                .selectedVendorIndex.value]
                                            .name ??
                                        "",
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.visible,
                                    style: Get.textTheme.headline4,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Divider(
                            color: Colors.white,
                            thickness: 2,
                          ),
                          Text(
                            "Amount:",
                            style: Get.textTheme.headline4,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          GlobalTextField(
                            validator: controller.addExpenseFieldsValidator,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            controller: controller.amountController,
                          ),
                          const Divider(
                            color: Colors.white,
                            thickness: 2,
                          ),
                          Text(
                            "Date:",
                            style: Get.textTheme.headline4,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Obx(
                            () => Expanded(
                              child: GlobalCupertinoDatePicker(
                                onDateChanged: (DateTime date) {
                                  controller.updateDate(date);
                                },
                                initialDateTime: controller.selectedDate.value,
                                label: DateFormat("dd-MMM-yy")
                                    .format(controller.selectedDate.value),
                              ),
                            ),
                          ),
                          const Divider(
                            color: Colors.white,
                            thickness: 2,
                          ),
                          Text(
                            "Expense Type:",
                            style: Get.textTheme.headline4,
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Obx(
                            () => Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  showCupertinoModalPopup(
                                      context: context,
                                      builder: (context) {
                                        return SizedBox(
                                          height: 250,
                                          child: CupertinoPicker.builder(
                                            childCount:
                                                controller.expenseTypes.length,
                                            itemExtent: 25,
                                            backgroundColor: Colors.white,
                                            onSelectedItemChanged: (index) {
                                              controller.selectedExpenseType
                                                  .value = index;
                                            },
                                            itemBuilder: (context, index) {
                                              return Text(
                                                controller.expenseTypes[index]
                                                        .name ??
                                                    "No name specified",
                                                textAlign: TextAlign.center,
                                                style: Get.textTheme.headline4
                                                    ?.copyWith(
                                                        color: Colors.black),
                                              );
                                            },
                                          ),
                                        );
                                      });
                                },
                                child: Container(
                                  // height: 45,
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 3),
                                  decoration: BoxDecoration(
                                    color: CustomColor.grey3,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    // "Bear Grylls is a man of steel",
                                    controller
                                            .expenseTypes[controller
                                                .selectedExpenseType.value]
                                            .name ??
                                        "",
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.visible,
                                    style: Get.textTheme.headline4,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Divider(
                            color: Colors.white,
                            thickness: 2,
                          ),
                          // Text(
                          //   "Payment Details (Optional):",
                          //   style: Get.textTheme.headline4,
                          // ),
                          RichText(
                            text: TextSpan(
                                text: "Expense Details ",
                                style: Get.textTheme.headline4,
                                children: [
                                  TextSpan(
                                    text: "(Optional)",
                                    style: Get.textTheme.subtitle2,
                                  ),
                                  const TextSpan(text: " :"),
                                ]),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          GlobalTextField(
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            controller: controller.expenseDetailsController,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Obx(
                            () => Visibility(
                              visible: !controller.isAddingExpense.value,
                              replacement: const Center(
                                  child: CircularProgressIndicator(
                                color: Colors.white,
                              )),
                              child: GlobalBottomButton(
                                text: "ADD",
                                style: Get.textTheme.headline4,
                                onPressed: () {
                                  controller.addExpense();
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
    );
  }
}
