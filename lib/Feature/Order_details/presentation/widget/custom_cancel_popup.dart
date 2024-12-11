import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../Core/constant/app_sized.dart';
import '../../../../Core/utils/app_colors.dart';
import '../../../../Core/widget/custom_app_button.dart';
import '../../../../Core/widget/custom_app_text.dart';

void cancelDialog({
  required BuildContext context,
  Function()? onPressed,
}) {
  showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            height: heightSize(context) * 0.15,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                const CustomAppText(
                  text: "هل انت متأكد من رفض الحجز؟",
                  fontWeight: FontWeight.w700,
                ),
                height(16),
                Row(
                  children: [
                    Flexible(
                      child: CustomAppButton(
                        width: double.maxFinite,
                        text: "الغاء",
                        height: 36,
                        radius: 8,
                        textColor: AppColors.black13,
                        containerColor: AppColors.white,
                        onPressed: () {
                          context.pop();
                        },
                      ),
                    ),
                    width(8),
                    Flexible(
                      child: CustomAppButton(
                        onPressed: onPressed,
                        height: 36,
                        text: "نعم",
                        width: double.maxFinite,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      });
}
