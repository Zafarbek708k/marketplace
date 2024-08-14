import 'package:flutter/material.dart';

class CustomStickWidget extends StatelessWidget {
  const CustomStickWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      margin: const EdgeInsets.symmetric(
        vertical: 12.0,
      ),
      height: 5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.5),
        color: Colors.grey,
      ),
    );
  }
}
