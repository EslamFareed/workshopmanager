import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:workshopmanager/Core/utils/app_colors.dart';

import 'custom_app_text.dart';

class CustomSwitchButton extends StatelessWidget {
  final void Function(dynamic)? onChanged;
  final ValueNotifier<bool>? controller;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? color;
  const CustomSwitchButton(
      {super.key,
      this.onChanged,
      this.controller,
      this.activeColor,
      this.inactiveColor,
      this.color});

  @override
  Widget build(BuildContext context) {
    return AdvancedSwitch(
      thumb: Container(
          height: 30,
          decoration: BoxDecoration(
            color: color ?? AppColors.primary,
            shape: BoxShape.circle,
          )),
      onChanged: onChanged,
      controller: controller,
      activeColor: activeColor ?? AppColors.black13,
      inactiveColor: inactiveColor ?? AppColors.greyEE,
      activeChild: const CustomAppText(
        text: "تفعيل",
        color: AppColors.primary,
      ),
      inactiveChild: const CustomAppText(
        text: "تعطيل",
        color: AppColors.white,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(15)),
      width: 70.0,
      height: 30.0,
      enabled: true,
      disabledOpacity: 0.5,
    );
  }
}
