import 'package:flutter/material.dart';
import 'package:workshopmanager/Core/utils/app_colors.dart';
import '../../../../../Core/constant/app_sized.dart';
import '../../../../../Core/widget/custom_app_text.dart';

class CustomResendOtp extends StatelessWidget {
  const CustomResendOtp({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CustomAppText(
          text: "هل لم تتلقى رمز التحقق؟",
          color: AppColors.grey9,
          fontWeight: FontWeight.w700,
        ),
        width(8),
        const CustomAppText(
          text: "اعادة ارسال",
          color: AppColors.primary,
          fontWeight: FontWeight.w700,
        ),
      ],
    );
  }
}
