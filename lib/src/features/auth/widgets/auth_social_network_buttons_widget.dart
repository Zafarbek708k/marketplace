

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialNetworkButtons extends StatelessWidget {
  const SocialNetworkButtons({super.key, required this.googleButton, required this.appleButton, required this.facebookButton});
  final VoidCallback googleButton;
  final VoidCallback appleButton;
  final VoidCallback facebookButton;

  @override
  Widget build(BuildContext context) {
    return   Column(
      children: [
        Padding(
          padding:  REdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              const Expanded(child: Divider(color: Colors.black)),
              Padding(
                padding: REdgeInsets.symmetric(horizontal: 10),
                child: const Text("Or sign in with"),
              ),
              const Expanded(child: Divider(color: Colors.black)),
            ],
          ),
        ),

        Padding(
          padding:  REdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                height: 75.h,
                shape: const CircleBorder(
                    side: BorderSide(color: Colors.black, width: 2.1)),
                onPressed: appleButton,
                child: const Center(
                  child: Icon(
                    Icons.apple,
                    size: 50,
                  ),
                ),
              ),
              MaterialButton(
                height: 75.h,
                shape: const CircleBorder(
                    side: BorderSide(color: Colors.black, width: 2.1)),
                onPressed: googleButton,
                child: const Center(
                  child: Icon(
                    Icons.g_mobiledata_outlined,
                    size: 50,
                  ),
                ),
              ),
              MaterialButton(
                height: 75.h,
                shape: const CircleBorder(
                    side: BorderSide(color: Colors.black, width: 2.1)),
                onPressed: facebookButton,
                child: const Center(
                  child: Icon(
                    Icons.facebook,
                    size: 50,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}