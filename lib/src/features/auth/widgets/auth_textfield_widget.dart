import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketplace/src/common/styles/app_colors.dart';


class AuthTextFieldWidget extends StatelessWidget {
  const AuthTextFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.togglePasswordVisibility,
    this.onChanged,
    this.onSubmitted,
    this.onEditingComplete,
    this.keyboardType = TextInputType.text,
  });

  final TextEditingController controller;
  final String hintText;
  final bool? obscureText;
  final VoidCallback? togglePasswordVisibility;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onEditingComplete;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(hintText, textAlign: TextAlign.start, style: const TextStyle(color: AppColors.black, fontWeight: FontWeight.bold)),
        Padding(
          padding: REdgeInsets.symmetric(vertical: 10),
          child: TextField(
            controller: controller,
            obscureText: obscureText ?? false,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              hintText: hintText,
              suffixIcon: obscureText != null
                  ? IconButton(icon: Icon(obscureText! ? Icons.visibility_off : Icons.visibility), onPressed: togglePasswordVisibility)
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(35.r),
                borderSide: const BorderSide(color: Colors.grey),
              ),
            ),
            onChanged: onChanged,
            onSubmitted: onSubmitted,
            onEditingComplete: onEditingComplete,
            onTapOutside: (_) {
              FocusScope.of(context).unfocus(); // Dismiss the keyboard when tapping outside
            },
          ),
        ),
      ],
    );
  }
}


