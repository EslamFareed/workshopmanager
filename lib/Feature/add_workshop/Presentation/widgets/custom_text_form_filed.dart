import 'package:flutter/material.dart';

class CustomTextFormFiled extends StatelessWidget {
  final TextEditingController controller;
  final String? hint;
  final bool obscureText;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final int? maxLength;
  final int? maxLines;
  final TextInputAction? textInputAction;
  final bool? enabled;
  final Color? fillColor;
  final bool? filled;
  final InputBorder? disabledBorder;
  final InputBorder? focusedBorder,
      enabledBorder,
      errorBorder,
      focusedErrorBorder;

  const CustomTextFormFiled({
    super.key,
    this.obscureText = false,
    required this.controller,
    this.hint,
    this.suffixIcon,
    this.validator,
    this.prefixIcon,
    this.maxLength,
    this.maxLines = 1,
    this.textInputAction,
    this.enabled,
    this.fillColor,
    this.filled,
    this.disabledBorder,
    this.focusedBorder,
    this.enabledBorder,
    this.errorBorder,
    this.focusedErrorBorder,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      textInputAction: textInputAction,
      maxLines: maxLines,
      maxLength: maxLength,
      validator: validator,
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        filled: filled,
        fillColor: fillColor,
        disabledBorder: disabledBorder,
        focusedBorder: focusedBorder,
        enabledBorder: enabledBorder,
        errorBorder: errorBorder,
        focusedErrorBorder: focusedErrorBorder,
      ),
    );
  }
}
