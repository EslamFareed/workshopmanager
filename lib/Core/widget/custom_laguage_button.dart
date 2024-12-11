import 'package:flutter/material.dart';
import 'package:workshopmanager/Core/utils/app_colors.dart';
import 'package:workshopmanager/Core/widget/custom_app_text.dart';

import '../constant/app_sized.dart';

class CustomLaguageButton extends StatelessWidget {
  const CustomLaguageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.language,
          color: AppColors.grey4B,
        ),
        width(2),
        const CustomAppText(
          text: "عربي",
          color: AppColors.grey4B,
          size: 14,
        ),
        width(2),
        const Icon(
          Icons.arrow_drop_down,
          color: AppColors.grey4B,
        ),
      ],
    );
  }
}
