import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../../../../../Core/utils/app_colors.dart';

class CustomOtpFileds extends StatelessWidget {
  final void Function(String)? onCodeChanged;
  final void Function(String)? onSubmit;
  const CustomOtpFileds({super.key, this.onCodeChanged, this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      showCursor: true,
      keyboardType: TextInputType.phone,
      textStyle: const TextStyle(
        color: AppColors.primary,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      focusedBorderColor: AppColors.primary,
      margin: const EdgeInsets.all(8),
      fieldHeight: 44,
      fieldWidth: 44,
      borderRadius: BorderRadius.circular(12),
      borderColor: AppColors.grey9,
      numberOfFields: 4,
      showFieldAsBox: true,
      onCodeChanged: onCodeChanged,
      onSubmit: onSubmit,
    );
  }
}
