import 'package:flutter/material.dart';
import '../../../../Core/styles/app_styles.dart';
import '../../../../Core/utils/app_colors.dart';
import '../../../add_workshop/Presentation/widgets/custom_text_form_filed.dart';

class CustomEmployerTextFormFiled extends StatelessWidget {
  final TextEditingController controller;
  final String? hint;
  final String? Function(String?)? validator;
  const CustomEmployerTextFormFiled(
      {super.key, required this.controller, this.hint, this.validator});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormFiled(
      controller: controller,
      fillColor: AppColors.greyEE,
      disabledBorder: themeData()
          .inputDecorationTheme
          .copyWith(
            disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.transparent,
              ),
            ),
          )
          .disabledBorder,
      enabledBorder: themeData()
          .inputDecorationTheme
          .copyWith(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.transparent,
              ),
            ),
          )
          .enabledBorder,
      errorBorder: themeData()
          .inputDecorationTheme
          .copyWith(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.redED,
              ),
            ),
          )
          .errorBorder,
      focusedBorder: themeData()
          .inputDecorationTheme
          .copyWith(
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.transparent,
              ),
            ),
          )
          .focusedBorder,
      focusedErrorBorder: themeData()
          .inputDecorationTheme
          .copyWith(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.redED,
              ),
            ),
          )
          .focusedErrorBorder,
      hint: hint,
      validator: validator,
    );
  }
}
