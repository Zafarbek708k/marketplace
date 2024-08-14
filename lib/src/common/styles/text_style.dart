import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

import "app_colors.dart";

@immutable
class AppTextStyle extends TextTheme {
  const AppTextStyle();

  @override
  TextStyle? get bodyLarge => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: FontSize.size16,
        letterSpacing: 0.1,
        color: AppColors.black,
        fontFamily: "TT-Uzum",
      );

  @override
  TextStyle? get bodyMedium => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size14,
        color: AppColors.black,
        fontFamily: "TT-Uzum",
      );

  @override
  TextStyle? get bodySmall => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size6_4,
        color: AppColors.black,
        fontFamily: "TT-Uzum",
      );

  @override
  TextStyle? get displayLarge => TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: FontSize.size62,
        color: AppColors.black,
        fontFamily: "TT-Uzum",
      );

  @override
  TextStyle? get displayMedium => TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: FontSize.size42,
        color: AppColors.black,
        fontFamily: "TT-Uzum",
      );

  @override
  TextStyle? get displaySmall => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size32,
        fontFamily: "TT-Uzum",
        color: AppColors.black,
      );

  @override
  TextStyle? get headlineLarge => TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: FontSize.size32,
        color: AppColors.black,
        fontFamily: "TT-Uzum",
      );

  @override
  TextStyle? get headlineMedium => TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: FontSize.size26,
        color: AppColors.black,
        fontFamily: "TT-Uzum",
      );

  @override
  TextStyle? get headlineSmall => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: FontSize.size24,
        color: AppColors.black,
        fontFamily: "TT-Uzum",
      );

  @override
  TextStyle? get labelLarge => TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: FontSize.size16,
        color: AppColors.black,
        fontFamily: "TT-Uzum",
      );

  @override
  TextStyle? get labelMedium => TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: FontSize.size14,
        color: AppColors.black,
        fontFamily: "TT-Uzum",
      );

  @override
  TextStyle? get labelSmall => TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: FontSize.size12,
        color: AppColors.black,
        fontFamily: "TT-Uzum",
      );

  @override
  TextStyle? get titleLarge => TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: FontSize.size28,
        color: AppColors.black,
        fontFamily: "TT-Uzum",
      );

  @override
  TextStyle? get titleMedium => TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: FontSize.size18,
        color: AppColors.black,
        fontFamily: "TT-Uzum",
      );

  @override
  TextStyle? get titleSmall => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size18,
        color: AppColors.black,
        fontFamily: "TT-Uzum",
      );
}

@immutable
class FontSize {
  const FontSize._();

  static final double size6_4 = 6.4.sp;
  static final double size7_8 = 7.8.sp;
  static final double size9_5 = 9.5.sp;
  static final double size10 = 10.sp;
  static final double size10_5 = 10.5.sp;
  static final double size12 = 12.sp;
  static final double size12_5 = 12.5.sp;
  static final double size13 = 13.sp;
  static final double size13_5 = 13.5.sp;
  static final double size14 = 14.sp;
  static final double size14_2 = 14.2.sp;
  static final double size16 = 16.sp;
  static final double size17_3 = 17.3.sp;
  static final double size18 = 18.sp;
  static final double size19_2 = 19.2.sp;
  static final double size20 = 20.sp;
  static final double size21 = 21.sp;
  static final double size22 = 22.sp;
  static final double size23_3 = 23.3.sp;
  static final double size24 = 24.sp;
  static final double size26 = 26.sp;
  static final double size28 = 28.sp;
  static final double size32 = 32.sp;
  static final double size42 = 42.sp;
  static final double size48 = 48.sp;
  static final double size62 = 62.2.sp;
}
