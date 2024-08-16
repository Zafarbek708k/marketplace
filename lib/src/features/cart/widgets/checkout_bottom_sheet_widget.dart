
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketplace/src/features/payment/pages/check_out_page.dart';

class CheckOutBottomSheet extends StatelessWidget {
  const CheckOutBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (context) {
        return Padding(
          padding: REdgeInsets.all(18.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: "Promo Code",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  suffixIcon: ElevatedButton(
                    onPressed: () {
                      // Apply promo code logic
                    },
                    child: Text("Apply"),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              _buildCostRow("Sub-Total", "\$407.94"),
              _buildCostRow("Delivery Fee", "\$25.00"),
              _buildCostRow("Discount", "-\$35.00"),
              Divider(),
              _buildCostRow("Total Cost", "\$397.94", isTotal: true),
              SizedBox(height: 20.h),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: REdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
                    backgroundColor: Colors.brown,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.r),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const CheckOutPage()));
                  },
                  child: Text("Proceed to Checkout", style: TextStyle(fontSize: 18.sp, color: Colors.white)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static Widget _buildCostRow(String title, String amount, {bool isTotal = false}) {
    return Padding(
      padding: REdgeInsets.symmetric(vertical: 5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}