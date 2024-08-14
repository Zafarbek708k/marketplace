import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:marketplace/src/features/auth/pages/sign_in.dart';
import 'package:marketplace/src/features/auth/pages/verify_code.dart';
import '../widgets/auth_bottom_last_text_button_widget.dart';
import '../widgets/auth_common_button_widget.dart';
import '../widgets/auth_social_network_buttons_widget.dart';
import '../widgets/auth_terms_conditions_widget.dart';
import '../widgets/auth_textfield_widget.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _obscureText = true;
  bool _isChecked = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
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
              Text("Create Account", style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w700, color: Colors.black)),
              SizedBox(height: 10.h),
              Text(
                "Fill your information below or register\n with your social account ",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: Colors.black),
              ),
              SizedBox(height: 50.h),
              AuthTextFieldWidget(
                controller: nameController,
                hintText: "Name",
                obscureText: null,
                onChanged: (val) {},
              ),
              AuthTextFieldWidget(
                controller: emailController,
                hintText: "Email",
                obscureText: null,
                onChanged: (val) {},
              ),
              AuthTextFieldWidget(
                controller: passwordController,
                hintText: "Password",
                obscureText: _obscureText,
                togglePasswordVisibility: _togglePasswordVisibility,
                onChanged: (val) {},
              ),
              TermsConditions(
                isChecked: _isChecked,
                onTap: () {},
                onTapCheckbox: (bool? value) {setState(() { _isChecked = value!;});},
              ),
              AuthCommonButton(onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context)=> const VerifyCode()));}, text: "Sign Up"),

              SocialNetworkButtons(googleButton: () {}, appleButton: () {}, facebookButton: () {}),

              BottomLastTextButton(
                text1: "Already have an account?",
                text2: "Sign In",
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignIn()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
