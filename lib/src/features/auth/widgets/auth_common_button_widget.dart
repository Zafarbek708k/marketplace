import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthCommonButton extends StatelessWidget {
  const AuthCommonButton({super.key, required this.onPressed, required this.text});
  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding:  REdgeInsets.symmetric(vertical: 12),
      child: MaterialButton(
          height: 50.h,
          minWidth: double.infinity,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.r)),
          color: Colors.brown,
          onPressed: onPressed,
          child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold))),
    );
  }
}