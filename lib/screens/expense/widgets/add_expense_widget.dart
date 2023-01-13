import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jkmart/controllers/expense_controller.dart';
import 'package:jkmart/controllers/lottery_controller.dart';
import 'package:jkmart/core/utils/colors.dart';
import 'package:jkmart/core/widgets/global_bottom_button.dart';
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
                                  "Name of Expense:",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: GlobalTextField(
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  controller: controller.nameController,
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
                                  "Date:",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Flexible(
                                child: GlobalTextField(
                                  validator:
                                      controller.addExpenseFieldsValidator,
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  controller: controller.dateController,
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
                                  "Amount:",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Flexible(
                                child: GlobalTextField(
                                  validator:
                                      controller.addExpenseFieldsValidator,
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  controller: controller.amountController,
                                ),
                              ),
                            ],
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
