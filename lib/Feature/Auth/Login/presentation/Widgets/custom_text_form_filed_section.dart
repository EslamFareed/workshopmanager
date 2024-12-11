import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshopmanager/Core/func/validation.dart';
import 'package:workshopmanager/Feature/Auth/Login/presentation/cubit/login_cubit.dart';
import '../../../../../Core/constant/app_sized.dart';
import '../../../../../Core/utils/app_colors.dart';
import '../../../../../Core/widget/custom_app_text.dart';
import '../../../../add_workshop/Presentation/widgets/custom_text_form_filed.dart';

class CustomTextFormFiledSection extends StatelessWidget {
  const CustomTextFormFiledSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        final cubit = context.read<LoginCubit>();
        return Form(
          key: cubit.formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppText(
                text: "رقم الهاتف ",
                size: 14,
                color: AppColors.black13,
              ),
              height(4),
              CustomTextFormFiled(
                controller: cubit.nameController,
                hint: "رقم الهاتف ",
                validator: (value) {
                  return AppValidation.phoneNumberVaildtor(
                      cubit.nameController.text);
                },
              ),
              height(16),
              const CustomAppText(
                text: "الرقم السرى*",
                size: 14,
                color: AppColors.black13,
              ),
              height(4),
              CustomTextFormFiled(
                controller: cubit.passwordController,
                obscureText: cubit.isObsecure,
                hint: "**********",
                suffixIcon: IconButton(
                  onPressed: () {
                    cubit.changeObscure();
                  },
                  icon: cubit.isObsecure
                      ? const Icon(Icons.visibility_off_outlined)
                      : const Icon(Icons.visibility_outlined),
                ),
                validator: (value) {
                  return AppValidation.passwordVaildtor(
                      cubit.passwordController.text);
                },
              )
            ],
          ),
        );
      },
    );
  }
}
