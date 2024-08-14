import 'package:flutter/material.dart'
    show Brightness, Color, ColorScheme, Colors, ThemeData;
import 'package:marketplace/src/common/styles/text_style.dart';

import 'app_colors.dart';

ThemeData lightMode = ThemeData(
  textTheme: const AppTextStyle(),
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    background: AppColors.backgroundLight,
    primary: AppColors.cardBackgroundLight,
    onPrimary: AppColors.textLight,
    onSecondary: AppColors.bottomSheetButtonsBackgroundLight,
    onSecondaryContainer: AppColors.bottomSheetDateTextLight,
    onSecondaryFixed: AppColors.bottomSheetSliderHandlerLight,
  ),
);

ThemeData darkMode = ThemeData(
  textTheme: const AppTextStyle(),
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    background: AppColors.backgroundDark,
    primary: AppColors.cardBackgroundDark,
    onPrimary: AppColors.textDark,
    onSecondary: AppColors.bottomSheetButtonsBackgroundDark,
    onSecondaryContainer: AppColors.bottomSheetDateTextDark,
    onSecondaryFixed: AppColors.bottomSheetSliderHandlerDark,
  ),
);
