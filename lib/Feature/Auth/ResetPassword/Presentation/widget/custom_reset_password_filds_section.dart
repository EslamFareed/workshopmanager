import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshopmanager/Feature/Auth/ResetPassword/Presentation/cubit/resetpassword_cubit.dart';
import '../../../../../Core/constant/app_sized.dart';
import '../../../../../Core/func/validation.dart';
import '../../../../../Core/utils/app_colors.dart';
import '../../../../../Core/widget/custom_app_text.dart';
import '../../../../add_workshop/Presentation/widgets/custom_text_form_filed.dart';

class CustomResetPasswordFildsSection extends StatelessWidget {
  const CustomResetPasswordFildsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
      builder: (context, state) {
        final cubit = context.read<ResetPasswordCubit>();
        return Form(
          key: cubit.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //! New Password
              const CustomAppText(
                text: "كلمة المرور الجديدة",
                size: 14,
                color: AppColors.black13,
                fontWeight: FontWeight.w700,
              ),
              height(4),
              CustomTextFormFiled(
                controller: cubit.passwordController,
                hint: "**********",
                obscureText: cubit.passwordObsecure,
                suffixIcon: IconButton(
                  onPressed: () {
                    cubit.changeObscure(field: 'password');
                  },
                  icon: cubit.passwordObsecure
                      ? const Icon(Icons.visibility_off_outlined)
                      : const Icon(Icons.visibility_outlined),
                ),
                validator: (value) {
                  return AppValidation.passwordVaildtor(
                      cubit.passwordController.text);
                },
              ),
              height(16),
              //! Confirm New Password
              const CustomAppText(
                text: "تأكيد كلمة المرور الجديدة",
                size: 14,
                color: AppColors.black13,
                fontWeight: FontWeight.w700,
              ),
              height(4),
              CustomTextFormFiled(
                controller: cubit.confirmPasswordController,
                obscureText: cubit.confirmPasswordObsecure,
                hint: "**********",
                suffixIcon: IconButton(
                  onPressed: () {
                    cubit.changeObscure(field: "confirmPassword");
                  },
                  icon: cubit.confirmPasswordObsecure
                      ? const Icon(Icons.visibility_off_outlined)
                      : const Icon(Icons.visibility_outlined),
                ),
                validator: (value) {
                  return AppValidation.confirmPasswordVaildtor(
                      password: cubit.confirmPasswordController.text,
                      value: cubit.passwordController.text);
                },
              )
            ],
          ),
        );
      },
    );
  }
}
