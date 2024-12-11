import "package:flutter/material.dart";
import "package:workshopmanager/Core/constant/app_sized.dart";
import "package:workshopmanager/Core/widget/custom_app_text.dart";
import "package:workshopmanager/Core/widget/custom_arrow_back.dart";
import "package:workshopmanager/Feature/Auth/register/presentation/widget/custom_register_text_fileds_section.dart";

import "../../../../../Core/utils/app_colors.dart";

Widget personalInfromationWidget(context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CustomArrowBack(),
          const CustomAppText(
            text: "بدء الاستخدام",
            color: AppColors.primary,
            size: 16,
            fontWeight: FontWeight.w700,
          ),
          width(5)
        ],
      ),
      height(32),
      const CustomAppText(
        text: "انشاء حساب مدير مركز",
        fontWeight: FontWeight.w700,
        color: AppColors.primary,
        size: 32,
      ),
      height(8),
      const CustomAppText(
        text: "اضف بياناتك لتسجيل الدخول فى التطبيق",
        fontWeight: FontWeight.w400,
        color: AppColors.grey66,
        size: 14,
      ),
      height(16),
      const CustomRegisterTextFiledsSection(),
    ],
  );
}
