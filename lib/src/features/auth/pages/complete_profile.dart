import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketplace/src/features/main/pages/main_wrapper.dart';

import '../widgets/auth_common_button_widget.dart';
import '../widgets/auth_number_textfield_widget.dart';
import '../widgets/auth_textfield_widget.dart';
import '../widgets/auth_top_back_button_widget.dart';

class CompleteProfile extends StatefulWidget {
  const CompleteProfile({super.key});

  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  String selectedGender = 'Select';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50.h),
              TopBackButtonWidget(onPressed: () {Navigator.pop(context);}),
              SizedBox(height: 20.h),
              Text(
                "Complete Your Profile",
                style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w700, color: Colors.black),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10.h),
              Padding(
                padding:  REdgeInsets.symmetric(horizontal: 18.0),
                child: Text(
                  "Don't worry, only you can see your personal data. No one else will be able to see it.",
                  style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 30.h),
              Stack(
                children: [
                  Container(
                    width: 150,
                    height: 120,
                    child: CircleAvatar(
                      radius: 50.r,
                      backgroundColor: Colors.grey.shade300,
                      child: Icon(Icons.person, size: 50.sp, color: Colors.grey),
                    ),
                  ),
                  Positioned(
                    bottom: 1,
                    right: 6,
                    child: CircleAvatar(
                      backgroundColor: Colors.brown, // Optional: Set a background color
                      radius: 20.r, // Adjust the size as needed
                      child: IconButton(
                        onPressed: () {
                          // Your edit functionality here
                        },
                        icon: const Icon(Icons.edit_outlined, color: Colors.white), // Adjust icon color
                        iconSize: 18.sp, // Adjust icon size
                      ),
                    ),
                  ),
                ],
              ),


              SizedBox(height: 20.h),
              AuthTextFieldWidget(
                controller: nameController,
                hintText: "Name",
                obscureText: null,
                onChanged: (val) {},
              ),
              SizedBox(height: 10.h),
              NumberTextFieldWidget(
                controller: phoneNumberController,
                hintText: "Phone Number",
                keyboardType: TextInputType.number,
                onChanged: (val) {},
              ),
              SizedBox(height: 10.h),

              Container(
                height: 60.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35.r),
                  border: Border.all(color: Colors.grey),
                ),
                child: DropdownButton<String>(
                  value: selectedGender,
                  dropdownColor: Colors.grey.shade200,
                  underline: const SizedBox.shrink(),
                  borderRadius: BorderRadius.circular(35.r),
                  icon:  Padding(
                    padding: REdgeInsets.only(right: 8.0),
                    child: const Icon(Icons.arrow_drop_down_circle_outlined),
                  ),
                  isExpanded: true,
                  elevation: 10,
                  items: ['Select', 'Male', 'Female', 'Other']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Row(
                        children: [
                          SizedBox(width: 10.w),
                          Text(value),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedGender = newValue!;
                    });
                  },
                ),
              ),

              SizedBox(height: 30.h),
              AuthCommonButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const MainWrapper()));
              }, text: "Complete Profile"),
              SizedBox(height: 10.h),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}