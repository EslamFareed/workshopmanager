import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:workshopmanager/Core/func/show_toast.dart';
import 'package:workshopmanager/Core/utils/app_imgaes.dart';
import 'package:workshopmanager/Core/widget/custom_arrow_back.dart';
import 'package:workshopmanager/Feature/Auth/ForgetPassword/Presentation/cubit/forget_password_cubit.dart';
import 'package:workshopmanager/Feature/add_workshop/Presentation/widgets/custom_text_form_filed.dart';
import 'package:workshopmanager/di.dart';
import '../../../../../Core/app/routes.dart';
import '../../../../../Core/constant/app_sized.dart';
import '../../../../../Core/func/validation.dart';
import '../../../../../Core/utils/app_colors.dart';
import '../../../../../Core/widget/custom_app_button.dart';
import '../../../../../Core/widget/custom_app_text.dart';
import '../../../../../Core/widget/custom_loader_widget.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPasswordCubit(getIt()),
      child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (context, state) {
          if (state is ForgetPasswordLoadingState) {
            const CustomLoaderWidget();
          } else if (state is ForgetPasswordSuccessState) {
            showSuccessToast(message: state.message);
            context.pushNamed(Routes.otp, pathParameters: {
              'phone': context.read<ForgetPasswordCubit>().controller.text,
            });
          } else if (state is ForgetPasswordFailureState) {
            showErrorToast(message: state.message);
          }
        },
        builder: (context, state) {
          final cubit = context.read<ForgetPasswordCubit>();
          return Scaffold(
              body: state is ForgetPasswordLoadingState
                  ? const Center(child: CustomLoaderWidget())
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 30),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustomArrowBack(),
                            height(64),
                            Center(
                                child: Image.asset(
                              AppImages.lock,
                            )),
                            height(64),
                            const CustomAppText(
                              text: "نسيت كلمة المرور؟",
                              fontWeight: FontWeight.w700,
                              color: AppColors.primary,
                              size: 32,
                            ),
                            height(16),
                            const CustomAppText(
                              text:
                                  "الرجاء ادخال بريدك الالكترونى رقم الهاتف  المسجل لتلقى رقم OTP",
                              fontWeight: FontWeight.w400,
                              color: AppColors.grey66,
                              size: 14,
                            ),
                            height(64),
                            const CustomAppText(
                              text: "البريد الالكترونى او رقم الهاتف",
                              size: 14,
                              color: AppColors.black13,
                            ),
                            height(4),
                            Form(
                              key: cubit.formKey,
                              child: CustomTextFormFiled(
                                controller: cubit.controller,
                                hint: "12345687456845 ",
                                validator: (value) {
                                  return AppValidation.phoneNumberVaildtor(
                                      cubit.controller.text);
                                },
                              ),
                            ),
                            height(64),
                            CustomAppButton(
                              text: "تقدم ",
                              width: double.maxFinite,
                              radius: 24,
                              onPressed: () {
                                cubit.forgetPassword();
                              },
                            ),
                          ],
                        ),
                      ),
                    ));
        },
      ),
    );
  }
}
