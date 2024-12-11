import 'package:flutter/material.dart';
import 'custom_app_button.dart';

class CustomContainerButton extends StatelessWidget {
  final String? text;
  final Function()? onPressed;
  final Widget? child;
  const CustomContainerButton(
      {super.key, this.text, this.onPressed, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 24,
      ),
      child: child ??
          CustomAppButton(
            text: text ?? "",
            width: double.maxFinite,
            radius: 24,
            onPressed: onPressed,
          ),
    );
  }
}
