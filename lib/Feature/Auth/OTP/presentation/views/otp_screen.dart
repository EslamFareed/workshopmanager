import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:workshopmanager/Core/app/routes.dart';
import 'package:workshopmanager/Core/utils/app_imgaes.dart';
import 'package:workshopmanager/Core/widget/custom_arrow_back.dart';
import 'package:workshopmanager/Core/widget/custom_loader_widget.dart';
import 'package:workshopmanager/Feature/Auth/OTP/presentation/cubit/otp_cubit.dart';
import 'package:workshopmanager/Feature/Auth/OTP/presentation/widget/custom_otp_fileds.dart';
import '../../../../../Core/constant/app_sized.dart';
import '../../../../../Core/func/show_toast.dart';
import '../../../../../Core/utils/app_colors.dart';
import '../../../../../Core/widget/custom_app_button.dart';
import '../../../../../Core/widget/custom_app_text.dart';
import '../../../../../di.dart';
import '../widget/custom_resend_otp.dart';

class OtpScreen extends StatelessWidget {
  final String phone;
  const OtpScreen({super.key, required this.phone});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OtpCubit(getIt()),
      child: BlocConsumer<OtpCubit, OtpState>(
        listener: (context, state) {
          if (state is OtpLoadingstate) {
            const CustomLoaderWidget();
          } else if (state is OtpFailureState) {
            showToast(message: state.message);
          } else if (state is OtpSuccessState) {
            showToast(message: state.model.message!);
            context.push(Routes.resetPassword, extra: state.model);
          }
        },
        builder: (context, state) {
          final cubit = context.read<OtpCubit>();
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Align(
                      alignment: AlignmentDirectional.topStart,
                      child: CustomArrowBack(),
                    ),
                    height(32),
                    Image.asset(
                      AppImages.largLogo,
                    ),
                    height(16),
                    const CustomAppText(
                      text: "ادخل رمز التحقق",
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                      size: 32,
                    ),
                    height(16),
                    const CustomAppText(
                      text:
                          "ادخل رمز التحقق المرسل الى رقم الهاتف +00924554544",
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey66,
                      size: 14,
                    ),
                    height(16),
                    CustomOtpFileds(
                      onCodeChanged: (String code) {
                        cubit.otpCode = code;
                      },
                      onSubmit: (String verificationCode) {
                        cubit.otpCode = verificationCode;
                      },
                    ),
                    height(16),
                    const CustomResendOtp(),
                    height(heightSize(context) * 0.2),
                    CustomAppButton(
                      text: "التحقق والمتابعة",
                      width: double.maxFinite,
                      radius: 24,
                      onPressed: () {
                        cubit.otp(
                          phone: phone,
                        );
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
