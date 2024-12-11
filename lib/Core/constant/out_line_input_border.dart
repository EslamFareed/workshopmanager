import 'package:flutter/material.dart';
import 'package:workshopmanager/Core/utils/app_colors.dart';

InputBorder outLineInputBorder({
  Color? color,
}) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color ?? AppColors.grey9));
}
