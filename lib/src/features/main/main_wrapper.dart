import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marketplace/generated/assets.dart';
import 'package:marketplace/src/common/styles/app_colors.dart';
import 'package:marketplace/src/features/cart/cart_page.dart';
import 'package:marketplace/src/features/chat/chat_page.dart';
import 'package:marketplace/src/features/home/home_page.dart';
import 'package:marketplace/src/features/profile/profile_page.dart';
import 'package:marketplace/src/features/wishlist/wishlist_page.dart';

import 'bloc/bottom_nav.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  /// Top Level Pages
  final List<Widget> topLevelPages = const [HomePage(), CartPage(), WishlistPage(), ChatPage(), ProfilePage()];

  /// on Page Changed
  void onPageChanged(int page) {
    BlocProvider.of<BottomNavCubit>(context).changeSelectedIndex(page);
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme contextColor = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: Colors.white,
      body: _mainWrapperBody(),
      bottomNavigationBar: _mainWrapperBottomNavBar(context),
    );
  }

  BottomAppBar _mainWrapperBottomNavBar(BuildContext context) {
    return BottomAppBar(
      color: const Color(0xff101010),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _bottomAppBarItem(
                  context,
                  defaultIcon: Assets.iconsHome,
                  page: 0,
                  filledIcon: Assets.iconsHomeFilled,
                ),
                _bottomAppBarItem(
                  context,
                  defaultIcon: Assets.iconsCartFilled,
                  page: 1,
                  filledIcon: Assets.iconsCart,
                ),
                _bottomAppBarItem(
                  context,
                  defaultIcon: Assets.iconsFav,
                  page: 2,
                  filledIcon: Assets.iconsHeartFilled,
                ),
                _bottomAppBarItem(
                  context,
                  defaultIcon: Assets.iconsMessage,
                  page: 3,
                  filledIcon: Assets.iconsMessageBulk,
                ),
                _bottomAppBarItem(
                  context,
                  defaultIcon: Assets.iconsProfileCircle,
                  page: 4,
                  filledIcon: Assets.iconsProfileFilled,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  PageView _mainWrapperBody() {
    return PageView(
      onPageChanged: (int page) => onPageChanged(page),
      controller: pageController,
      children: topLevelPages,
    );
  }

  Widget _bottomAppBarItem(
    BuildContext context, {
    required String defaultIcon,
    required int page,
    required String filledIcon,
  }) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<BottomNavCubit>(context).changeSelectedIndex(page);
        pageController.animateToPage(page,
            duration: const Duration(milliseconds: 10),
            curve: Curves.fastLinearToSlowEaseIn);
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: context.watch<BottomNavCubit>().state == page ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(25)
        ),
        child: Center(
          child: SvgPicture.asset(
            context.watch<BottomNavCubit>().state == page ? filledIcon : defaultIcon,
            height: 26,
            width: 26,
            color: context.watch<BottomNavCubit>().state == page ? AppColors.brown : AppColors.navbarIcon,
          ),
        ),
      ),
    );
  }
}
