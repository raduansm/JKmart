import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jkmart/controllers/income_controller.dart';
import 'package:jkmart/core/utils/colors.dart';
import 'package:jkmart/core/widgets/global_bottom_button.dart';
import 'package:jkmart/core/widgets/global_cupertino_datepicker.dart';

class IncomeFilterWidget extends GetView<IncomeController> {
  const IncomeFilterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 150,
            child: GlobalBottomButton(
              text: index == 0
                  ? controller.vendorFilterValue.value != null
                      ? controller.vendors[controller.vendorFilterValue.value!].name ?? "No Name Specified"
                      : "Vendor"
                  : index == 1
                      ? controller.filterDate.value != null
                          ? DateFormat("dd-MMM-yyyy").format(controller.filterDate.value ?? DateTime.now())
                          : "Date"
                      : controller.paymentTypeFilterValue.value != null
                          ? controller.paymentTypes[controller.paymentTypeFilterValue.value!].name ?? "Name not specified"
                          : "Payment Type",
              onPressed: () {
                //Vendor Filter
                if (index == 0) {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (context) {
                      return Container(
                        height: 320,
                        color: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 250,
                              child: CupertinoPicker.builder(
                                scrollController: FixedExtentScrollController(initialItem: controller.vendorFilterValue.value ?? -1),
                                childCount: controller.vendors.length,
                                itemExtent: 25,
                                backgroundColor: Colors.white,
                                onSelectedItemChanged: (index) {
                                  controller.vendorFilterValue.value = index;
                                },
                                itemBuilder: (context, index) {
                                  return Text(
                                    controller.vendors[index].name ?? "No name specified",
                                    textAlign: TextAlign.center,
                                    style: Get.textTheme.headline4?.copyWith(color: Colors.black),
                                  );
                                },
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: GlobalBottomButton(
                                        text: "Reset",
                                        onPressed: () {
                                          controller.vendorFilterValue.value = null;
                                          controller.getIncomes();
                                          Get.back();
                                        },
                                        isSolidButton: false)),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: GlobalBottomButton(
                                    text: "Search",
                                    onPressed: () {
                                      if (controller.vendorFilterValue.value == null) return;
                                      controller.getIncomes();
                                      Get.back();
                                    },
                                    isSolidButton: true,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                  return;
                }

                //Date Filter
                if (index == 1) {
                  showCupertinoModalPopup(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 200,
                          color: CustomColor.black,
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                          child: Obx(
                            () => Column(
                              children: [
                                SizedBox(
                                  height: 50,
                                  child: GlobalCupertinoDatePicker(
                                    onDateChanged: (DateTime date) {
                                      controller.filterDate.value = date;
                                    },
                                    initialDateTime: controller.filterDate.value,
                                    label: DateFormat("dd-MMM-yyyy").format(controller.filterDate.value ?? DateTime.now()),
                                  ),
                                ),
                                const SizedBox(height: 15),
                                Row(
                                  children: [
                                    Expanded(
                                        child: GlobalBottomButton(
                                            text: "Reset",
                                            onPressed: () {
                                              controller.filterDate.value = null;
                                              controller.getIncomes();
                                              Get.back();
                                            },
                                            isSolidButton: false)),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: GlobalBottomButton(
                                        text: "Search",
                                        onPressed: () {
                                          if (controller.filterDate.value == null) return;
                                          controller.getIncomes();
                                          Get.back();
                                        },
                                        isSolidButton: true,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                }

                //PaymentType Filter
                if (index == 2) {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (context) {
                      return Container(
                        height: 320,
                        color: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 250,
                              child: CupertinoPicker.builder(
                                scrollController: FixedExtentScrollController(initialItem: controller.paymentTypeFilterValue.value ?? -1),
                                childCount: controller.paymentTypes.length,
                                itemExtent: 25,
                                backgroundColor: Colors.white,
                                onSelectedItemChanged: (index) {
                                  controller.paymentTypeFilterValue.value = index;
                                },
                                itemBuilder: (context, index) {
                                  return Text(
                                    controller.paymentTypes[index].name ?? "No name specified",
                                    textAlign: TextAlign.center,
                                    style: Get.textTheme.headline4?.copyWith(color: Colors.black),
                                  );
                                },
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: GlobalBottomButton(
                                        text: "Reset",
                                        onPressed: () {
                                          controller.paymentTypeFilterValue.value = null;
                                          controller.getIncomes();
                                          Get.back();
                                        },
                                        isSolidButton: false)),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: GlobalBottomButton(
                                    text: "Search",
                                    onPressed: () {
                                      if (controller.paymentTypeFilterValue.value == null) return;
                                      controller.getIncomes();
                                      Get.back();
                                    },
                                    isSolidButton: true,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                  return;
                }
              },
              isSolidButton: index == 0
                  ? controller.vendorFilterValue.value != null
                      ? true
                      : false
                  : index == 1
                      ? controller.filterDate.value != null
                          ? true
                          : false
                      : controller.paymentTypeFilterValue.value != null
                          ? true
                          : false,
              color: index == 0
                  ? controller.vendorFilterValue.value != null
                      ? CustomColor.blue2
                      : CustomColor.blue2
                  : index == 1
                      ? controller.filterDate.value != null
                          ? CustomColor.blue2
                          : CustomColor.blue2
                      : controller.paymentTypeFilterValue.value != null
                          ? CustomColor.blue2
                          : CustomColor.blue2,
              style: Get.textTheme.headline6?.copyWith(
                color: index == 0
                    ? controller.vendorFilterValue.value != null
                        ? CustomColor.white
                        : CustomColor.blue2
                    : index == 1
                        ? controller.filterDate.value != null
                            ? CustomColor.white
                            : CustomColor.blue2
                        : controller.paymentTypeFilterValue.value != null
                            ? CustomColor.white
                            : CustomColor.blue2,
              ),
            ),
          );
        },
        itemCount: 3,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 10);
        },
      ),
    );
  }
}
