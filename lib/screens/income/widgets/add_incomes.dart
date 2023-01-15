import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jkmart/controllers/income_controller.dart';
import 'package:jkmart/core/utils/colors.dart';
import 'package:jkmart/core/widgets/global_bottom_button.dart';
import 'package:jkmart/core/widgets/global_cupertino_datepicker.dart';
import 'package:jkmart/core/widgets/global_text_field.dart';

class AddIncome extends GetView<IncomeController> {
  const AddIncome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: () => Get.focusScope!.unfocus(),
                child: AlertDialog(
                  scrollable: true,
                  backgroundColor: CustomColor.secondaryColor,
                  content: SizedBox(
                    height: 400,
                    width: Get.size.width,
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
                        GlobalTextField(
                          validator: controller.addIncomeFieldsValidator,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.name,
                          controller: controller.vendorController,
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
                          validator: controller.addIncomeFieldsValidator,
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
                        const SizedBox(
                          height: 20,
                        ),
                        Obx(
                          () => Visibility(
                            visible: !controller.isAddingIncome.value,
                            replacement: const Center(
                                child: CircularProgressIndicator(
                              color: Colors.white,
                            )),
                            child: GlobalBottomButton(
                              text: "ADD",
                              style: Get.textTheme.headline4,
                              onPressed: () {
                                controller.addIncome();
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
