import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jkmart/controllers/income_controller.dart';
import 'package:jkmart/core/utils/colors.dart';
import 'package:jkmart/core/widgets/global_bottom_button.dart';
import 'package:jkmart/screens/home/widgets/appdrawer.dart';

class IncomeScreen extends GetView<IncomeController> {
  const IncomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryColor,
      // key: controller.scaffoldKey,
      drawer: const AppDrawer(),
      body: SafeArea(
        child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: CustomColor.secondaryColor,
                      child: Image.asset('assets/images/menu.png', scale: 5),
                    ),
                  ),
                  const Text(
                    'Income',
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
                                        const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            "Date:",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        const Divider(
                                          color: Colors.white,
                                          thickness: 1,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            "Name:",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        const Divider(
                                          color: Colors.white,
                                          thickness: 1,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            "Ammount:",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
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
                        size: 25,
                        color: Colors.white60,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 40,
                child: Row(
                  children: [
                    Expanded(
                      child: GlobalBottomButton(
                        text: "Name",
                        onPressed: () {},
                        isSolidButton: true,
                        color: CustomColor.secondaryColor,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: GlobalBottomButton(
                        text: "Amount",
                        onPressed: () {},
                        isSolidButton: true,
                        color: CustomColor.secondaryColor,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: GlobalBottomButton(
                        text: "Date",
                        onPressed: () {},
                        isSolidButton: true,
                        color: CustomColor.secondaryColor,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 40,
                color: CustomColor.secondaryColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Jk Mart",
                        style: Get.textTheme.bodyText1!
                            .copyWith(color: Colors.white)),
                    // const SizedBox(width: 1),
                    const Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: VerticalDivider(
                        color: Colors.white,
                        thickness: 1,
                      ),
                    ),
                    Text("\$50",
                        style: Get.textTheme.bodyText1!
                            .copyWith(color: Colors.white)),

                    const Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: VerticalDivider(
                        color: Colors.white,
                        thickness: 1,
                      ),
                    ),
                    Text("12/12/2021",
                        style: Get.textTheme.bodyText1!
                            .copyWith(color: Colors.white)),
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
