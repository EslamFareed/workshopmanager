import 'dart:io';

import 'package:flutter/material.dart';
import 'package:workshopmanager/Core/utils/app_colors.dart';

import '../../../../../Core/constant/app_sized.dart';
import '../../../../../Core/widget/custom_app_text.dart';

class CustomPickImageRow extends StatelessWidget {
  final String? text;
  final File? image;
  final String? uploadText;
  final Widget widget;
  final Widget imageWidget;
  final Color? color;
  const CustomPickImageRow({
    super.key,
    this.text,
    this.uploadText,
    required this.widget,
    required this.imageWidget,
    this.color,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.grey9,
        ),
        color: color,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              widget,
              width(16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppText(
                    text: text ?? '',
                    size: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  height(8),
                  CustomAppText(
                    text: uploadText ?? '',
                    size: 12,
                    fontWeight: FontWeight.w400,
                  )
                ],
              ),
            ],
          ),
          imageWidget,
        ],
      ),
    );
  }
}
