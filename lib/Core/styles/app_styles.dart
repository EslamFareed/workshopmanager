import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constant/out_line_input_border.dart';
import '../utils/app_colors.dart';

ThemeData themeData() {
  return ThemeData(
    inputDecorationTheme: InputDecorationTheme(
      disabledBorder: outLineInputBorder(),
      focusedBorder: outLineInputBorder(),
      enabledBorder: outLineInputBorder(),
      errorBorder: outLineInputBorder(color: AppColors.redED),
      focusedErrorBorder: outLineInputBorder(color: AppColors.redED),
      filled: true,
      fillColor: AppColors.white,
      hintStyle: const TextStyle(
        fontWeight: FontWeight.w400,
        color: AppColors.grey9,
        fontSize: 14,
      ),
      suffixIconColor: AppColors.grey9,
    ),
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: AppColors.white),
      backgroundColor: AppColors.white,
      centerTitle: true,
      elevation: 0.0,
    ),
    fontFamily: "Tajawal",
    scaffoldBackgroundColor: AppColors.white,
  );
}
