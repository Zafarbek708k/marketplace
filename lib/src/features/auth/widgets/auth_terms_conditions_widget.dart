import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'auth_bottom_last_text_button_widget.dart';

class TermsConditions extends StatelessWidget {
  final bool isChecked;
  final VoidCallback onTap;
  final ValueChanged<bool?>? onTapCheckbox;

  const TermsConditions({
    super.key,
    required this.isChecked,
    required this.onTap,
    required this.onTapCheckbox,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          activeColor: Colors.brown, // Set the active color to brown
          checkColor: Colors.white, // Set the check color to white
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.r),
          ),
          onChanged: onTapCheckbox,
        ),
        Padding(
          padding:  REdgeInsets.only(bottom: 18.0),
          child: BottomLastTextButton(
            text1: "Agree with",
            text2: "Terms & Conditions",
            onTap: onTap,
          ),
        ),
      ],
    );
  }
}