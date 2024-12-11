import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workshopmanager/Core/extensions/extensions.dart';
import '../../../../Core/constant/app_sized.dart';
import '../../../../Core/utils/app_colors.dart';
import '../../../../Core/widget/custom_app_text.dart';

class CustomConatinerTitle extends StatelessWidget {
  const CustomConatinerTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: AppColors.primary,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.arrow_back,
            color: AppColors.white,
          ).onTap(() {
            context.pop();
          }),
          const CustomAppText(
            text: "الخدمة الاضافية",
            fontWeight: FontWeight.w700,
            color: AppColors.white,
          ),
          width(0),
        ],
      ),
    );
  }
}
