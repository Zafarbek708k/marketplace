import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../widgets/auth_bottom_last_text_button_widget.dart';
import '../widgets/auth_common_button_widget.dart';
import '../widgets/auth_pin_put_widget.dart';

class VerifyCode extends StatefulWidget {
  const VerifyCode({super.key});

  @override
  State<VerifyCode> createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {
  late final TextEditingController pinController;

  @override
  void initState() {
    super.initState();
    pinController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50.h),
              TopBackButtonWidget(onPressed: (){}),
              SizedBox(height: 150.h),
              Text("Verify Code", style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w700, color: Colors.black)),
              SizedBox(height: 10.h),
              Text(
                "Please enter the code we just sent to email \n example@gmail.com",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: Colors.black),
              ),
              SizedBox(height: 50.h),
              PinPutWidget(
                pinController: pinController,
                onChanged: (value) {},
                onCompleted: (val) {},
              ),
              SizedBox(height: 20.h),
              BottomLastTextButton(
                text1: "Don't receive OTP?",
                text2: "ReSend Code",
                onTap: () {},
              ),
              SizedBox(height: 20.h),
              AuthCommonButton(onPressed: () {}, text: "Verify"),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}


class TopBackButtonWidget extends StatelessWidget {
  const TopBackButtonWidget({super.key, required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return   Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        MaterialButton(
          onPressed: onPressed,
          height: 50.h,
          shape: const CircleBorder(side: BorderSide(color: Colors.grey)),
          child: const Icon(
            CupertinoIcons.arrow_left,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}
