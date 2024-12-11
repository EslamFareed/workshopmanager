import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:workshopmanager/Core/func/show_toast.dart';
import 'package:workshopmanager/Core/utils/app_imgaes.dart';
import 'package:workshopmanager/Core/widget/custom_arrow_back.dart';
import 'package:workshopmanager/Feature/Auth/OTP/data/model/otp_model.dart';
import 'package:workshopmanager/Feature/Auth/ResetPassword/Presentation/cubit/resetpassword_cubit.dart';
import 'package:workshopmanager/Feature/Auth/ResetPassword/Presentation/widget/custom_reset_password_filds_section.dart';
import 'package:workshopmanager/di.dart';
import '../../../../../Core/app/routes.dart';
import '../../../../../Core/constant/app_sized.dart';
import '../../../../../Core/utils/app_colors.dart';
import '../../../../../Core/widget/custom_app_button.dart';
import '../../../../../Core/widget/custom_app_text.dart';
import '../../../../../Core/widget/custom_loader_widget.dart';

class ResestPasswordScreen extends StatelessWidget {
  final OtpModel model;
  const ResestPasswordScreen({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetPasswordCubit(getIt()),
      child: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
        listener: (context, state) {
          if (state is ResetpasswordLoadingState) {
            const CustomLoaderWidget();
          } else if (state is ResetpasswordSuccessState) {
            showToast(message: state.message);
            context.push(Routes.login);
          } else if (state is ResetpasswordFailureState) {
            showToast(message: state.message);
          }
        },
        builder: (context, state) {
          final cubit = context.read<ResetPasswordCubit>();
          return Scaffold(
            body: state is ResetpasswordLoadingState
                ? const Center(child: CustomLoaderWidget())
                : Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 30),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomArrowBack(),
                          height(32),
                          Center(child: Image.asset(AppImages.reset)),
                          height(16),
                          const CustomAppText(
                            text: "اعادة تعيين كلمة المرور",
                            fontWeight: FontWeight.w700,
                            color: AppColors.primary,
                            size: 32,
                          ),
                          height(4),
                          const CustomAppText(
                            text: "ادخل كلمة المرور الجديدة",
                            fontWeight: FontWeight.w400,
                            color: AppColors.grey66,
                            size: 14,
                          ),
                          height(16),
                          const CustomResetPasswordFildsSection(),
                          height(64),
                          CustomAppButton(
                            text: "تأكيد كلمة المرور",
                            width: double.maxFinite,
                            radius: 24,
                            onPressed: () {
                              cubit.resetPassword(uuid: model.uuid!);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
