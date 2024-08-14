import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomLastTextButton extends StatelessWidget {
  const BottomLastTextButton({
    super.key,
    required this.text1,
    required this.text2,
    required this.onTap,
  });

  final String text1;
  final String text2;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(top: 20),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text1,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
            InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(8.r), // Border radius for splash effect
              splashColor: Colors.brown.withOpacity(0.2),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h), // Padding around text for better splash visibility
                child: Text(
                  text2,
                  style: const TextStyle(
                    color: Colors.brown,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

