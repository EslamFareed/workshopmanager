import 'package:flutter/material.dart';
import 'package:workshopmanager/Core/utils/app_colors.dart';
import 'package:workshopmanager/Core/widget/custom_app_text.dart';

class CustomAppButton extends StatelessWidget {
  final String? text;
  final void Function()? onPressed;
  final double? radius;
  final Color? containerColor;
  final Color? textColor;
  final double? width;
  final Color? borderColor;
  final double? height;
  final Widget? child;
  const CustomAppButton({
    super.key,
    this.text,
    this.onPressed,
    this.radius,
    this.containerColor,
    this.textColor,
    this.width,
    this.borderColor,
    this.height,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: containerColor ?? AppColors.primary,
        borderRadius: BorderRadius.circular(radius ?? 8),
        border: Border.all(color: borderColor ?? AppColors.primary),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: FittedBox(
          child: child ??
              CustomAppText(
                text: text ?? "",
                color: textColor ?? AppColors.white,
                size: 16,
                fontWeight: FontWeight.w700,
              ),
        ),
      ),
    );
  }
}
