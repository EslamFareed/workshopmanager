import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workshopmanager/Core/extensions/extensions.dart';
import '../../../../Core/constant/app_sized.dart';
import '../../../../Core/utils/app_colors.dart';
import '../../../../Core/widget/custom_app_text.dart';

class CustomAppTitleAndArrowback extends StatelessWidget {
  const CustomAppTitleAndArrowback({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.greyD9,
              )),
          child: const Icon(Icons.arrow_back),
        ).onTap(() {
          context.pop();
        }),
        const CustomAppText(
          text: "تتبع الخدمة",
          size: 18,
          fontWeight: FontWeight.w700,
        ),
        width(0),
      ],
    );
  }
}
