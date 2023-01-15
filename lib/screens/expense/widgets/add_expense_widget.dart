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
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: () => Get.focusScope!.unfocus(),
                child: AlertDialog(
                  scrollable: true,
                  backgroundColor: CustomColor.secondaryColor,
                  content: Form(
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
                          "Name of Expense:",
                          style: Get.textTheme.headline4,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        GlobalTextField(
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          controller: controller.nameController,
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
                          keyboardType: TextInputType.name,
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
                          () => GlobalCupertinoDatePicker(
                            onDateChanged: (DateTime date) {
                              controller.updateDate(date);
                            },
                            initialDateTime: controller.selectedDate.value,
                            label: DateFormat("dd-MMM-yy")
                                .format(controller.selectedDate.value),
                          ),
                        ),

                        // const Divider(
                        //   color: Colors.white,
                        //   thickness: 1,
                        // ),
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
