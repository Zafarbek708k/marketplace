import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketplace/src/features/auth/pages/sign_in.dart';
import 'package:marketplace/src/features/auth/widgets/auth_textfield_widget.dart';

import '../widgets/auth_common_button_widget.dart';
import '../widgets/auth_top_back_button_widget.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  void _togglePasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }
  void _toggleConfirmPasswordVisibility() {
    setState(() {
      isConfirmPasswordVisible = !isConfirmPasswordVisible;
    });
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
              TopBackButtonWidget(onPressed: () {Navigator.pop(context);}),
              SizedBox(height: 20.h),
              Text("New Password", style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w700, color: Colors.black)),
              SizedBox(height: 10.h),
              Text(
                "Your new password must be different \n from previously used passwords",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: Colors.black),
              ),
              SizedBox(height: 50.h),
              AuthTextFieldWidget(
                controller: passwordController,
                hintText: "Password",
                obscureText: isPasswordVisible,
                togglePasswordVisibility: _togglePasswordVisibility,
                onChanged: (val) {},
              ),
              AuthTextFieldWidget(
                controller: confirmPasswordController,
                hintText: "Confirm Password",
                obscureText: isConfirmPasswordVisible,
                togglePasswordVisibility: _toggleConfirmPasswordVisibility,
                onChanged: (val){},
              ),
              SizedBox(height: 20.h),
              AuthCommonButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SignIn()));
              }, text: "Create New Password"),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
