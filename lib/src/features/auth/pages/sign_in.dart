import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketplace/src/features/auth/bloc/auth_bloc.dart';
import 'package:marketplace/src/features/auth/pages/forget_verify_code_page.dart';
import 'package:marketplace/src/features/auth/pages/sign_up.dart';
import 'package:marketplace/src/features/main/pages/main_wrapper.dart';
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

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          final authBloc = context.read<AuthBloc>();
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Center(
              child: Padding(
                padding: REdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Sign In",
                      style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w700, color: Colors.black),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "Hi! Welcome back, you've been missed",
                      style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: Colors.black),
                    ),
                    SizedBox(height: 50.h),
                    AuthTextFieldWidget(
                      controller: authBloc.emailController,
                      hintText: "Email",
                      obscureText: null,
                      onChanged: (val) {
                        // Handle email input change
                      },
                    ),
                    AuthTextFieldWidget(
                      controller: authBloc.passwordController,
                      hintText: "Password",
                      obscureText: state.obscureText,
                      togglePasswordVisibility: () {authBloc.add(TogglePasswordVisibility());},
                      onChanged: (val) {},
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const ForgetVerifyCodePage()),
                            );
                          },
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(color: Colors.brown),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 50.h),
                    AuthCommonButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const MainWrapper()));
                    }, text: "Sign In"),
                    SocialNetworkButtons(
                      googleButton: () {},
                      appleButton: () {},
                      facebookButton: () {},
                    ),
                    BottomLastTextButton(
                      text1: "Don't have an account?",
                      text2: "Sign Up",
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );


  }
}
