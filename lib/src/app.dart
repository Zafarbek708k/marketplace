import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketplace/src/features/auth/pages/sign_in.dart';
import 'package:marketplace/src/features/main/bloc/bottom_nav.dart';

import 'features/main/pages/main_wrapper.dart';

class MyApp extends StatelessWidget {
  // final _splashVisitedNotifier = ValueNotifier(false);

  MyApp({super.key}) {
    // _initSplashVisitedFlag();
  }

  // Future<void> _initSplashVisitedFlag() async {
  //   final splashVisited = await AppStorage.$read(key: StorageKey.splashVisited);
  //   if (splashVisited != null) {
  //     _splashVisitedNotifier.value = splashVisited == 'true';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      builder: (context, child) {
        return DevicePreview(
          enabled: kDebugMode && false,
          builder: (BuildContext context) {
            return   BlocProvider(
              create: (context) => BottomNavCubit(),
              child: const MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Marketplace',
                // home: MainWrapper()
                home: SignIn(),
              ),
            );
          },
        );
      },
    );
  }
}