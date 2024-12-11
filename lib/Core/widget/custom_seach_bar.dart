import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class CustomSearchBar extends StatelessWidget {
  final String? hintText;
  final double? borderRadius;
  final Color? borderColor;
  final TextEditingController? searchController;
  final Function(String)? onSearchChanged;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  const CustomSearchBar({
    super.key,
    this.hintText,
    this.borderRadius,
    this.borderColor,
    this.searchController,
    this.onSearchChanged,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: searchController,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius ?? 0),
          ),
          borderSide: const BorderSide(color: AppColors.grey9),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 0)),
          borderSide: BorderSide(color: borderColor ?? AppColors.grey9),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 0)),
          borderSide: BorderSide(color: borderColor ?? AppColors.grey9),
        ),
        hintText: hintText,
        hintTextDirection: TextDirection.rtl,
        hintStyle: const TextStyle(color: AppColors.grey9),
        suffixIcon: suffixIcon,
      ),
      onChanged: onSearchChanged,
    );
  }
}
