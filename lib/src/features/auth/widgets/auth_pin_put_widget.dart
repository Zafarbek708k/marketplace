import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class PinPutWidget extends StatelessWidget {
  PinPutWidget({super.key, required this.pinController, this.onChanged, this.onCompleted});
  final TextEditingController pinController;
  final FocusNode focusNode = FocusNode();
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onCompleted;

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
      fontSize: 22,
      color: Color.fromRGBO(30, 60, 87, 1),
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(19),
      border: Border.all(color: Colors.black),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return  Pinput(
      controller: pinController,
      focusNode: focusNode,
      defaultPinTheme: defaultPinTheme,
      separatorBuilder: (index) => SizedBox(width: 8.w),
      validator: (value) {return value == '2222' ? null : 'Pin is incorrect';},
      hapticFeedbackType: HapticFeedbackType.lightImpact,
      onCompleted: onCompleted,
      onChanged: onChanged,
      cursor: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin:  REdgeInsets.only(bottom: 9),
            width: 22,
            height: 1,
            color: Colors.black,
          ),
        ],
      ),
      focusedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: Colors.black),
        ),
      ),
      submittedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(19.r),
          border: Border.all(color: Colors.black),
        ),
      ),
      errorPinTheme: defaultPinTheme.copyBorderWith(
        border: Border.all(color: Colors.redAccent),
      ),
    );
  }
}