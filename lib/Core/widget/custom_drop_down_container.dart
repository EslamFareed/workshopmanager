import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import 'custom_app_text.dart';

class CustomDropDownContainer extends StatelessWidget {
  final String hint;
  final List<DropdownMenuItem<Object?>>? items;
  final void Function(Object?)? onChanged;
  final BorderRadiusGeometry? borderRadius;
  final Widget? icon;
  final Color? hintColor;
  const CustomDropDownContainer(
      {super.key,
      required this.hint,
      this.items,
      this.onChanged,
      this.borderRadius,
      this.icon,
      this.hintColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.grey9,
        ),
      ),
      child: DropdownButton(
        icon: icon ??
            const Icon(
              Icons.keyboard_arrow_down_outlined,
              size: 25,
              color: AppColors.grey41,
            ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
        isExpanded: true,
        underline: Container(),
        hint: CustomAppText(
          text: hint,
          size: 14,
          color: hintColor ?? AppColors.grey9,
          fontWeight: FontWeight.w700,
        ),
        items: items,
        onChanged: (val) {},
      ),
    );
  }
}
