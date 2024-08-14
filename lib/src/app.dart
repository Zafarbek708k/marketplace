import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketplace/src/features/main/bloc/bottom_nav.dart';

import 'features/main/main_wrapper.dart';

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
        return BlocProvider(
          create: (context) => BottomNavCubit(),
          child: const MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Marketplace',
              home: MainWrapper()
          ),
        );
      },
    );
  }
}