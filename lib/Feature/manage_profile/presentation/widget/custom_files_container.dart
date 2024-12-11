import 'package:flutter/material.dart';
import 'package:workshopmanager/Core/constant/app_sized.dart';

import '../../../../Core/utils/app_colors.dart';
import '../../../../Core/widget/custom_app_text.dart';

class CustomFilesContainer extends StatelessWidget {
  final String fileText;
  const CustomFilesContainer({super.key, required this.fileText});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.greyEE,
      ),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.green,
                ),
                child: const Icon(
                  Icons.done,
                  color: AppColors.white,
                ),
              ),
              width(16),
              CustomAppText(
                text: fileText,
                size: 16,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
