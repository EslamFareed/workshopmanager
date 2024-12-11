import 'package:flutter/material.dart';
import 'package:workshopmanager/Core/utils/app_colors.dart';

class CustomAppText extends StatelessWidget {
  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final double? size;
  final TextOverflow? overflow;
  const CustomAppText({
    super.key,
    required this.text,
    this.color,
    this.fontWeight,
    this.size,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      overflow: overflow,
      text,
      style: TextStyle(
        fontSize: size ?? 14,
        fontWeight: fontWeight ?? FontWeight.w500,
        color: color ?? AppColors.black13,
      ),
    );
  }
}
