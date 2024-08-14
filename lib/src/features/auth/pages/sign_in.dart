import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketplace/src/features/auth/pages/sign_up.dart';
import '../widgets/auth_bottom_last_text_button_widget.dart';
import '../widgets/auth_common_button_widget.dart';
import '../widgets/auth_social_network_buttons_widget.dart';
import '../widgets/auth_textfield_widget.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _obscureText = true;
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
              Text("Sign In", style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w700, color: Colors.black)),
              SizedBox(height: 10.h),
              Text("Hi! Welcome back, you've been missed", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: Colors.black)),
              SizedBox(height: 50.h),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(color: Colors.brown),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50.h),
              AuthCommonButton(onPressed: () {}, text: "Sign In"),
              SocialNetworkButtons(googleButton: () {}, appleButton: () {}, facebookButton: () {}),
              BottomLastTextButton(
                text1: "Don't have an account?",
                text2: "Sign Up",
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUp()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
