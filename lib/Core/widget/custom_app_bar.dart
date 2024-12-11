import 'package:flutter/material.dart';
import 'package:workshopmanager/Core/utils/app_colors.dart';
import 'package:workshopmanager/Core/widget/custom_app_text.dart';

PreferredSizeWidget? appBar({
  Color? color,
  Widget? leading,
  List<Widget>? actions,
  Color? textColor,
  required String title,
}) {
  return AppBar(
    surfaceTintColor: AppColors.white,
    elevation: 0,
    backgroundColor: color,
    automaticallyImplyLeading: false,
    leading: leading,
    actions: actions,
    title: CustomAppText(
      text: title,
      color: textColor ?? AppColors.white,
      fontWeight: FontWeight.w700,
      size: 18,
    ),
  );
}
