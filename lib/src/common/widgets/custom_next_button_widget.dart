import 'package:flutter/material.dart';
import 'package:marketplace/src/common/styles/app_colors.dart';

class CustomNextButtonWidget extends StatelessWidget {
  const CustomNextButtonWidget(
      {super.key, required this.text, required this.onPressed});
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      height: 46,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      minWidth: MediaQuery.of(context).size.width,
      color: AppColors.green,
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          color: AppColors.white,
          fontWeight: FontWeight.w700,
          fontSize: 20,
        ),
      ),
    );
  }
}
