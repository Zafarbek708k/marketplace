import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({super.key});

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 50.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                shape: const CircleBorder(side: BorderSide(color: Colors.black)),
                child: const Icon(Icons.arrow_back),
              ),
              const Text("Checkout", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(width: 100.w)
            ],
          )
        ],
      ),
    );
  }
}
