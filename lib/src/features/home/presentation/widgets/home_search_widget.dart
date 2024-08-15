

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeSearchWidget extends StatelessWidget {
  const HomeSearchWidget(
      {super.key, required this.controller, this.togglePasswordVisibility, this.onChanged, this.onSubmitted, this.onEditingComplete, this.filterPressed});

  final TextEditingController controller;
  final VoidCallback? togglePasswordVisibility;
  final VoidCallback? filterPressed;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onEditingComplete;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: TextField(
            controller: TextEditingController(),
            decoration: InputDecoration(
              hintText: "search",
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(35.r),
                borderSide: const BorderSide(color: Colors.grey),
              ),
            ),
            onChanged: (val) {},
            onSubmitted: (val) {},
            onEditingComplete: () {},
            onTapOutside: (_) {
              FocusScope.of(context).unfocus(); // Dismiss the keyboard when tapping outside
            },
          ),
        ),
        MaterialButton(
          height: 50,
          onPressed: filterPressed,
          shape: const CircleBorder(side: BorderSide(color: Colors.brown)),
          child: const Icon(
            Icons.fitbit,
            size: 24,
          ),
        )
      ],
    );
  }
}
