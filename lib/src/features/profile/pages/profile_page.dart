import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/profile_common_button_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 18.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: size.height*0.06.h),

              const Center(child: Text("Profile", style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold))),

              SizedBox(height: size.height*0.02.h),

              Stack(
                children: [
                  SizedBox(
                    width: size.width.w * 0.4,
                    height: size.height.h * 0.2,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey.shade300,
                      child: Icon(Icons.person, size: 40.sp, color: Colors.grey),
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
              const Center(child: Text("Esther Howard", style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold))),

              SizedBox(height: size.height*0.02.h),

              ProfileCommonButton(onPressed: (){},icon: const Icon(Icons.person),text: "Your Profile",),
              ProfileCommonButton(onPressed: (){},icon: const Icon(Icons.payment),text: "Payment Methods",),
              ProfileCommonButton(onPressed: (){},icon: const Icon(Icons.note_alt_outlined),text: "My Orders",),
              ProfileCommonButton(onPressed: (){},icon: const Icon(Icons.settings),text: "Setting",),
              ProfileCommonButton(onPressed: (){},icon: const Icon(Icons.help),text: "Help Center",),
              ProfileCommonButton(onPressed: (){},icon: const Icon(Icons.lock_person_outlined),text: "Privacy Policy",),
              ProfileCommonButton(onPressed: (){},icon: const Icon(Icons.person_add_alt),text: "Invites Friends",),
              ProfileCommonButton(onPressed: (){},icon: const Icon(Icons.logout),text: "Log out",),

              SizedBox(height: size.height*0.2.h),
            ],
          ),
        ),
      ),
    );
  }
}


