
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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