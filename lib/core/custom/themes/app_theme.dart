import 'package:cs_app/core/custom/themes/app_colors.dart';
import 'package:cs_app/core/custom/themes/text_styles.dart';
import 'package:flutter/material.dart';

import 'custom_colors.dart';
import 'font_manager.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryLight,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    fontFamily: FontManager.montserrat,
    textTheme: AppTextStyles.lightTextTheme,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.appBarLight,
      titleTextStyle: AppTextStyles.lightTextTheme.displayMedium!.copyWith(color: AppColors.white100),
      centerTitle: false,
      elevation: 0,
    ),
    iconTheme: const IconThemeData(color: AppColors.black100),
    popupMenuTheme: PopupMenuThemeData(
      color: AppColors.white100,
      labelTextStyle: WidgetStateProperty.all(AppTextStyles.lightTextTheme.displaySmall),
    ),
    extensions: [
      CustomColors(
        chatBubbleColor: AppColors.black20,
      ),
    ],

  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryDark,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    fontFamily: FontManager.montserrat,
    textTheme: AppTextStyles.darkTextTheme,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.appBarDark,
      titleTextStyle: AppTextStyles.darkTextTheme.displayMedium!.copyWith(color: AppColors.white100),
      centerTitle: false,
      elevation: 0,
    ),
    iconTheme: const IconThemeData(color: AppColors.white100),
    popupMenuTheme: PopupMenuThemeData(
      color: AppColors.white20,
      labelTextStyle: WidgetStateProperty.all(AppTextStyles.darkTextTheme.displaySmall),
    ),
    extensions: [
      CustomColors(
        chatBubbleColor: AppColors.white80,
      ),
    ],
  );
}
