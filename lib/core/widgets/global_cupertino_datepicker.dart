import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jkmart/core/utils/colors.dart';

class GlobalCupertinoDatePicker extends StatelessWidget {
  const GlobalCupertinoDatePicker({
    Key? key,
    this.label,
    this.labelStyle,
    this.initialDateTime,
    this.modalBackgroundColor,
    this.modalHeight,
    this.boxHeight,
    this.boxBackgroundColor,
    this.boxRarius,
    required this.onDateChanged,
  }) : super(key: key);

  final String? label;
  final TextStyle? labelStyle;
  final DateTime? initialDateTime;
  final Color? modalBackgroundColor;
  final double? modalHeight;
  final double? boxHeight;
  final Color? boxBackgroundColor;
  final double? boxRarius;
  final ValueChanged<DateTime> onDateChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showCupertinoModalPopup(
            context: context,
            builder: (context) {
              return SizedBox(
                height: modalHeight ?? 250,
                child: CupertinoDatePicker(
                  onDateTimeChanged: onDateChanged,
                  backgroundColor: modalBackgroundColor ?? Colors.white,
                  initialDateTime: initialDateTime ?? DateTime.now(),
                  mode: CupertinoDatePickerMode.date,
                ),
              );
            });
      },
      child: Container(
        height: boxHeight ?? 45,
        decoration: BoxDecoration(
          color: boxBackgroundColor ?? CustomColor.grey3,
          borderRadius: BorderRadius.circular(boxRarius ?? 10),
        ),
        alignment: Alignment.center,
        child: Text(
          label ?? "Select a date",
          textAlign: TextAlign.center,
          style: labelStyle ?? Get.textTheme.headline4,
        ),
      ),
    );
  }
}
