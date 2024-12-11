import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshopmanager/Core/func/validation.dart';
import 'package:workshopmanager/Core/utils/app_colors.dart';
import 'package:workshopmanager/Core/widget/custom_app_text.dart';
import 'package:workshopmanager/Feature/Auth/register/presentation/cubit/register_cubit.dart';
import 'package:workshopmanager/Feature/add_workshop/Presentation/widgets/custom_text_form_filed.dart';

import '../../../../../Core/constant/app_sized.dart';

class CustomRegisterTextFiledsSection extends StatefulWidget {
  const CustomRegisterTextFiledsSection({super.key});

  @override
  State<CustomRegisterTextFiledsSection> createState() =>
      _CustomSignUpTextFormFiledSectionState();
}

class _CustomSignUpTextFormFiledSectionState
    extends State<CustomRegisterTextFiledsSection> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        final cubit = context.read<RegisterCubit>();
        return Form(
          key: cubit.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //!Name Filed
              const CustomAppText(text: "الاسم*"),
              height(4),
              CustomTextFormFiled(
                hint: "الاسم",
                textInputAction: TextInputAction.next,
                controller: cubit.nameController,
                validator: (value) {
                  return AppValidation.displayNameValidator(
                      cubit.nameController.text);
                },
              ),
              height(16),
              //! Phone Number Filed
              const CustomAppText(text: "رقم الهاتف*"),
              height(4),
              CustomTextFormFiled(
                hint: " رقم الهاتف",
                textInputAction: TextInputAction.next,
                controller: cubit.phoneNumberController,
                validator: (value) {
                  return AppValidation.phoneNumberVaildtor(
                      cubit.phoneNumberController.text);
                },
              ),
              height(16),
              //! Email Filed
              const CustomAppText(text: "البريد الالكترونى"),
              height(4),
              CustomTextFormFiled(
                hint: "البريد الالكترونى",
                textInputAction: TextInputAction.next,
                controller: cubit.emailController,
                validator: (value) {
                  return AppValidation.emailValidator(
                      cubit.emailController.text);
                },
              ),
              height(16),

              //! Password Filed
              const CustomAppText(text: "الرقم السرى*"),
              height(4),
              CustomTextFormFiled(
                hint: "************",
                controller: cubit.passwordController,
                validator: (value) {
                  return AppValidation.passwordVaildtor(
                      cubit.passwordController.text);
                },
                obscureText: cubit.passwordObsecure,
                textInputAction: TextInputAction.next,
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        cubit.passwordObsecure = !cubit.passwordObsecure;
                      });
                    },
                    icon: cubit.passwordObsecure
                        ? const Icon(
                            Icons.visibility_off_outlined,
                            color: AppColors.greyD9,
                          )
                        : const Icon(
                            Icons.visibility_outlined,
                            color: AppColors.greyD9,
                          )),
              ),
              height(16),

              //! Confirm Password Filed
              const CustomAppText(text: "تأكيد الرقم السرى*"),
              height(4),
              CustomTextFormFiled(
                hint: "************",
                controller: cubit.confirmPasswordController,
                validator: (value) {
                  return AppValidation.confirmPasswordVaildtor(
                      value: cubit.passwordController.text,
                      password: cubit.confirmPasswordController.text);
                },
                obscureText: cubit.passwordObsecure,
                textInputAction: TextInputAction.next,
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        cubit.confirmPassowordObsecure =
                            !cubit.confirmPassowordObsecure;
                      });
                    },
                    icon: cubit.confirmPassowordObsecure
                        ? const Icon(
                            Icons.visibility_off_outlined,
                            color: AppColors.greyD9,
                          )
                        : const Icon(
                            Icons.visibility_outlined,
                            color: AppColors.greyD9,
                          )),
              ),
              height(16),
            ],
          ),
        );
      },
    );
  }
}
