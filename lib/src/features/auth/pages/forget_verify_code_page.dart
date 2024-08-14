import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketplace/src/features/auth/pages/new_password.dart';
import '../widgets/auth_bottom_last_text_button_widget.dart';
import '../widgets/auth_common_button_widget.dart';
import '../widgets/auth_pin_put_widget.dart';
import '../widgets/auth_top_back_button_widget.dart';

class ForgetVerifyCodePage extends StatefulWidget {
  const ForgetVerifyCodePage({super.key});

  @override
  State<ForgetVerifyCodePage> createState() => _ForgetVerifyCodePageState();
}

class _ForgetVerifyCodePageState extends State<ForgetVerifyCodePage> {
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
              TopBackButtonWidget(onPressed: () {
                Navigator.pop(context);
              }),
              SizedBox(height: 150.h),
              Text("Forget Verify Code", style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w700, color: Colors.black)),
              SizedBox(height: 10.h),
              Text(
                "Please enter the code we just sent to email \n example@gmail.com",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: Colors.black),
              ),
              SizedBox(height: 50.h),
              PinPutWidget(pinController: pinController),
              SizedBox(height: 20.h),
              BottomLastTextButton(text1: "Don't receive OTP?", text2: "ReSend Code", onTap: () {}),
              SizedBox(height: 20.h),
              AuthCommonButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const NewPassword()));
                },
                text: "Verify",
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
